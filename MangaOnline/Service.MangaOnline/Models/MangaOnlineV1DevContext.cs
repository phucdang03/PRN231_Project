﻿using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace Service.MangaOnline.Models
{
    public partial class MangaOnlineV1DevContext : DbContext
    {
        public MangaOnlineV1DevContext()
        {
        }

        public MangaOnlineV1DevContext(DbContextOptions<MangaOnlineV1DevContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Author> Authors { get; set; } = null!;
        public virtual DbSet<Category> Categories { get; set; } = null!;
        public virtual DbSet<CategoryManga> CategoryMangas { get; set; } = null!;
        public virtual DbSet<Chaptere> Chapteres { get; set; } = null!;
        public virtual DbSet<Comment> Comments { get; set; } = null!;
        public virtual DbSet<FollowList> FollowLists { get; set; } = null!;
        public virtual DbSet<History> Histories { get; set; } = null!;
        public virtual DbSet<IpUserVote> IpUserVotes { get; set; } = null!;
        public virtual DbSet<Manga> Mangas { get; set; } = null!;
        public virtual DbSet<Notification> Notifications { get; set; } = null!;
        public virtual DbSet<Page> Pages { get; set; } = null!;
        public virtual DbSet<ReadingHistory> ReadingHistories { get; set; } = null!;
        public virtual DbSet<User> Users { get; set; } = null!;
        public virtual DbSet<UserToken> UserTokens { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Data Source=LAPTOP-TBCGNF2H;Initial Catalog=MangaOnline.V1.Dev; Trusted_Connection=SSPI;Encrypt=false;TrustServerCertificate=true");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Author>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Name).HasMaxLength(50);

                entity.Property(e => e.SubId).ValueGeneratedOnAdd();
            });

            modelBuilder.Entity<Category>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.SubId).ValueGeneratedOnAdd();
            });

            modelBuilder.Entity<CategoryManga>(entity =>
            {
                entity.HasKey(e => e.SubId)
                    .HasName("PK__Category__4D9BB84ADA78D0C7");

                entity.ToTable("CategoryManga");

                entity.HasOne(d => d.Category)
                    .WithMany(p => p.CategoryMangas)
                    .HasForeignKey(d => d.CategoryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CategoryManga_Categories");

                entity.HasOne(d => d.Manga)
                    .WithMany(p => p.CategoryMangas)
                    .HasForeignKey(d => d.MangaId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CategoryManga_Mangas");
            });

            modelBuilder.Entity<Chaptere>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.FilePdf).HasColumnName("FilePDF");

                entity.Property(e => e.Name).HasMaxLength(50);

                entity.Property(e => e.SubId).ValueGeneratedOnAdd();

                entity.HasOne(d => d.Manga)
                    .WithMany(p => p.Chapteres)
                    .HasForeignKey(d => d.MangaId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Chapteres_Mangas");
            });

            modelBuilder.Entity<Comment>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.HasOne(d => d.Manga)
                    .WithMany(p => p.Comments)
                    .HasForeignKey(d => d.MangaId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Comments_Mangas");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Comments)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Comments_Users");
            });

            modelBuilder.Entity<FollowList>(entity =>
            {
                entity.ToTable("FollowList");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.HasOne(d => d.Manga)
                    .WithMany(p => p.FollowLists)
                    .HasForeignKey(d => d.MangaId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_FollowList_Mangas");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.FollowLists)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_FollowList_Users");
            });

            modelBuilder.Entity<History>(entity =>
            {
                entity.ToTable("History");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Date)
                    .HasColumnType("datetime")
                    .HasColumnName("date");

                entity.Property(e => e.From)
                    .HasMaxLength(256)
                    .HasColumnName("from");

                entity.Property(e => e.Hash)
                    .HasMaxLength(256)
                    .HasColumnName("hash");

                entity.Property(e => e.To)
                    .HasMaxLength(256)
                    .HasColumnName("to");

                entity.Property(e => e.User)
                    .HasMaxLength(256)
                    .HasColumnName("user");

                entity.Property(e => e.Value)
                    .HasMaxLength(256)
                    .HasColumnName("value");
            });

            modelBuilder.Entity<IpUserVote>(entity =>
            {
                entity.HasKey(e => e.MangaId)
                    .HasName("pk_my_table");

                entity.ToTable("IpUserVote");

                entity.Property(e => e.MangaId).ValueGeneratedNever();
            });

            modelBuilder.Entity<Manga>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.SubId).ValueGeneratedOnAdd();

                entity.HasOne(d => d.Author)
                    .WithMany(p => p.Mangas)
                    .HasForeignKey(d => d.AuthorId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Mangas_Authors");
            });

            modelBuilder.Entity<Notification>(entity =>
            {
                entity.ToTable("Notification");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.HasOne(d => d.Chapter)
                    .WithMany(p => p.Notifications)
                    .HasForeignKey(d => d.ChapterId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Notification_Chapteres");
            });

            modelBuilder.Entity<Page>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.HasOne(d => d.Chapter)
                    .WithMany(p => p.Pages)
                    .HasForeignKey(d => d.ChapterId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Pages_Chapteres");
            });

            modelBuilder.Entity<ReadingHistory>(entity =>
            {
                entity.ToTable("ReadingHistory");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.HasOne(d => d.Manga)
                    .WithMany(p => p.ReadingHistories)
                    .HasForeignKey(d => d.MangaId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ReadingHistory_Mangas");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.ReadingHistories)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ReadingHistory_Users");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Email).HasMaxLength(256);

                entity.Property(e => e.SubId).ValueGeneratedOnAdd();
            });

            modelBuilder.Entity<UserToken>(entity =>
            {
                entity.HasKey(e => e.UserId);

                entity.Property(e => e.UserId).ValueGeneratedNever();

                entity.Property(e => e.Email).HasMaxLength(256);

                entity.HasOne(d => d.User)
                    .WithOne(p => p.UserToken)
                    .HasForeignKey<UserToken>(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UserTokens_Users");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
