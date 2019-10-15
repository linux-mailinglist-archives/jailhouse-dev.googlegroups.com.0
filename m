Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBCHDSXWQKGQELZAEKEI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73f.google.com (mail-qk1-x73f.google.com [IPv6:2607:f8b0:4864:20::73f])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF0ED6FFB
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 09:13:13 +0200 (CEST)
Received: by mail-qk1-x73f.google.com with SMTP id k67sf19376292qkc.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 00:13:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571123592; cv=pass;
        d=google.com; s=arc-20160816;
        b=Bq1J6djLyuRT2BOEjHEo1y69c2iFmMxev3KubKDry/moXUtzHF13vm5C/jXhgjSwNu
         rKn2wJhr2EEGJgqEAIeK1YdTmWzwmnboHMxkuOEToLuoOUIkCWPiDKruyhD5ErAz/4sg
         0h/aVCwWckBaqWuxf3Rn2gRIauUJTPkN7q2yL+sH7Ynb5KFjaltAYgNH1S3oY1WlDaGA
         Lf3TiqiozEtE5GwQINPM/mQX6HCjW9Cz5FqXrN4TJHS6cTRjG7ci+kDG8SknRGRfJARA
         /+rqDPpjhLNSwbMRsVVCe2bBsUGjja0SHK9V28HOK6/tRanAq643T9hhdRLiJGsrzVkf
         5h1Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=uCPAGkH2Wle1pVpnYhVeTPw1Dyu9JQY1A9j/gTrDTOs=;
        b=OgVWiigGklIruy0ITGqnaUhQL0Rb6D/Ku80Wbt3JEwAOSJrkkAQ3rcQ+FNDz1g2VPv
         x51aHR9fFTSre0M5onu461M41I0NFKYTt2ZK3ewuyD5+/DrUl8clTMjCy4jqdkIYwD2/
         ilsX7Gxn4d0gJ60yjpabkWw9KeJt0dBtGrn52PH4azmB+MJDOcpj9X0aJFnhymyMhBda
         aFiEIlRDGOnzE3hUX1tEgTKd6YFBmKnPgp1B8go+3heuJuvBYl5eMZA0sETwL4268P12
         uoFjHqBYSd7EuRP2Hss36ggGUVuFrEk0bbSZiBHe5jbQaksrWNIlFpoTEo/xyruG2eg+
         8zlg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=L4zMP7tW;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uCPAGkH2Wle1pVpnYhVeTPw1Dyu9JQY1A9j/gTrDTOs=;
        b=X68YZWos/d75rHsGdAHf3giUVYe6O0JvYuxwQmeA6hIV7sHIVS/RfL8Rg31lx1sN6y
         oknFDDMvjIvjRZ0A5loogiJlRb28btm1Tar9KkjHv+wHkm9vHcsgLIUONXSOn/65S/tN
         5SwlSOQfFXiqnCZ75WvYBL9iaU0f1uJcd77lSiXC7KHbw+IXVSf/SFIWQTwVT1nEdyhS
         FHofKVriREJ7FVYESC+3rUMJSGRero9tTJrucOBg2mcdUyZt4YZCtWVJ4ekryhuRJO9n
         pZV3sooT99fWUqSiDy/KDsYC7ooiW1CpEVZIRavoKRKz5sc2pW/NeefnZVcoc7jsWn1h
         S+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=uCPAGkH2Wle1pVpnYhVeTPw1Dyu9JQY1A9j/gTrDTOs=;
        b=UFrst6kD5q8SDfUJIdYFa0GnwhX5DQcl7vAfX7NcO6miVLMApUYdR16YgoW7zaYRTa
         KxEz2iNziiS9PevpCoGMmodZrd/PjM5BLPjyEL2CmqzeDT+VqV4VYPNU652Fkfbuk9pK
         QAlCIY9cTFFjrysDv5OaYuj0jw+ZJRwEfXqwpjzq6s+yxe8p1Eg75XUPSfdfS1nn5+Gz
         AvD01UlkUpzW5o7zvmvKPjnMvkk2846sms6JNU3LpWwZc2ALRbR7JvQxUrv+lD756BM3
         BEgP45xnLTxsfpBlK8N7X5lFqy286HX6TuAOxr/bhNJ85kF1pcAy0M/6e2TjCbGlDgXD
         u3ug==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUmK/azGI16Uu5k2Rn3PAQviUm6tlejE6OOnNc4I+ZQZMA7w3H8
	1mW2zaK8i4hG7gMZx8nmxFY=
X-Google-Smtp-Source: APXvYqy+PwLLaKBeRmFFDql7U476MG1gEaDixthh4hkiSkK9LylxCsQ0hYZoADwCg1zMmV/rkwk7YA==
X-Received: by 2002:a05:620a:218f:: with SMTP id g15mr31549964qka.303.1571123592614;
        Tue, 15 Oct 2019 00:13:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:a0d:: with SMTP id 13ls5161479qkk.7.gmail; Tue, 15 Oct
 2019 00:13:12 -0700 (PDT)
X-Received: by 2002:a37:98c2:: with SMTP id a185mr34706927qke.438.1571123592213;
        Tue, 15 Oct 2019 00:13:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571123592; cv=none;
        d=google.com; s=arc-20160816;
        b=wH/WnF+7J4bDCGlceDRK33OLUnCajGOje/5I9mYOzqpDZCJCMxu88RGxSCycwxW9uq
         MwoywhK0e5GlGSF59s3Tl+SaIeXTRZUKjOIFaclFTPZFrp6bnu4VNfNEjzgrmlU62Y78
         x/F3SPzCI6+bjmgVjHdOA6bNceHovHVhvs+qfN3hxN4i7yFUJ2yymE65PWrUpUOpiR6S
         an3hZd1Y0F7aBfBoi0LaJtFDUqQSjjx2d0PrKBGeaFy5fTzpsVhFiRMhHPltfX+HaeXv
         CCflWe7bMurjP8IsdxDC+gu4v/7KU4PuNAmF0zzE7pTe6EmV21G38Bg5L3Pa6Vhxj8Yf
         xFsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=kW7Dyt4d6KQGoRJONFGe7MkVxUHr1v+qtUkYCvYRXmc=;
        b=AmGNaAeaJQwOS4uZ0S41u+grNuRS+Ruw/QDJhlG2DyRZ9/Tnteo3ddGVmg13gLFfkR
         LDxC98cFZ9E5RyW0OS0vcgeVKVZ/9pTvHaCBMaJRz1pu+qTr6z58FkxqKdueeCNkllMw
         J4rNsWhE6eeimiG053by0EEBxjve2LZPlXLTfycQvEms0+pC4wYIm2aqRkMN9aYq3b8t
         sHE2uUPw2d+f49ZyI81+qrKpenmX4Qh/4ZKYnFAr0I+4UqPBlQEdMqSS6zNplGd5Hfe+
         ifTFhtLb9lPjrI3jtOpnjpKvmakhLVDoI+BDSTjd3A4RZK0kTvN8vQ2rTa/06qwJHs7j
         pLxg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=L4zMP7tW;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-18.smtp.github.com (out-18.smtp.github.com. [192.30.252.201])
        by gmr-mx.google.com with ESMTPS id o13si1184004qkj.4.2019.10.15.00.13.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 00:13:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) client-ip=192.30.252.201;
Received: from github-lowworker-2e54e43.va3-iad.github.net (github-lowworker-2e54e43.va3-iad.github.net [10.48.17.27])
	by smtp.github.com (Postfix) with ESMTP id 10BD56E1178
	for <jailhouse-dev@googlegroups.com>; Tue, 15 Oct 2019 00:13:12 -0700 (PDT)
Date: Tue, 15 Oct 2019 00:13:12 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/wip/ivshmem2/0026e0-abd5e6@github.com>
Subject: [siemens/jailhouse] abd5e6: configs: x86: Add virtio block device
 between qemu...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=L4zMP7tW;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.201 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=github.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

  Branch: refs/heads/wip/ivshmem2
  Home:   https://github.com/siemens/jailhouse
  Commit: abd5e6589de0680883222de821105b6bbbb4ef64
      https://github.com/siemens/jailhouse/commit/abd5e6589de0680883222de821105b6bbbb4ef64
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-15 (Tue, 15 Oct 2019)

  Changed paths:
    M configs/x86/linux-x86-demo.c
    M configs/x86/qemu-x86.c

  Log Message:
  -----------
  configs: x86: Add virtio block device between qemu-x86 and linux-x86-demo

This enables the root cell to provide a virtio block device via ivshmem
to the non-root Linux cell.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/wip/ivshmem2/0026e0-abd5e6%40github.com.
