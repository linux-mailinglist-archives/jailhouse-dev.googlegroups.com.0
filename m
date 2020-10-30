Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBQV4576AKGQEXLHMCTQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23c.google.com (mail-oi1-x23c.google.com [IPv6:2607:f8b0:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 1881E2A017D
	for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Oct 2020 10:35:00 +0100 (CET)
Received: by mail-oi1-x23c.google.com with SMTP id c198sf2416139oig.7
        for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Oct 2020 02:35:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1604050499; cv=pass;
        d=google.com; s=arc-20160816;
        b=iNGEiHXQfcq+0G7E88chS513Fho0wdiPXZpUTD3Cf1Eix1njtYaOMIaq2qby59htO+
         ocYQE8LtWJZlVYTymIBVEAVwKltiwbr0LUpU0yjRsHT54etHSU2G4tVnwIR+xyt8f/ej
         w5pgxSJ0oWCd7xZnzu54j2wI4HOdFsRlBO0jzPKtaD+0M2V6N04h1jMjzaKsWtARLl5e
         8+nP7r1zpMHo2AJF5qprTBspoKF9Gm51YfIlNE+qdbDYHmxGlQrKqFAycpkcyoK/m/+5
         dsDztKMa+mCPFSqdd6quwVEeiZWHNLrZVTTjr35THsbslS4+CKVbTwLtXa2sNHevgCp8
         TYCw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=DD03yuVw7SjJmS6qkfXRQreMzPbT7kgxfPg1mQntqlE=;
        b=TiptIpw1z7yv3jSFWzr6/eDu17mjBd438I7vY8XlBW9GIwmk8RR+jX1XiRRtrDJtNo
         auxAY3OlZSYR6LLVbLN5Wgk5vZteFwfF6bYLoLF2wHOUZ0hw0k1piIeDA52z6T9zV8SA
         9M4L0kFqUtgCQuyL1qDYQH5NTCdFs10O+znaa5tJfziPrSRCbD3tutmFH+ofYE7tEq0s
         Zyd3LoRc1RG1T9jw0yMvgv1qOEa62UymzeHij3G/znzvsNtqW4ffL51nWo6yCWIPugep
         M8ascbo86XWTsZ110LAKRmEANaA5vdpQJ6WhGh67TSyMu0wr7u7Emy2CXg7ZjWg0JJAB
         uoyQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=VVfQhnZl;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=DD03yuVw7SjJmS6qkfXRQreMzPbT7kgxfPg1mQntqlE=;
        b=LoRN3lqV8ljAdP0UrCKNPPgyLN2PmzRkZEPBsFa8sTkzeNf6qYavDe4vg9siGVbt3j
         CU0U7C3pAlwE/uNO//DFMwesFDs5GojWKe//fCDeJwt4Q3L4Yt2osu1DKV0yc9oeYtdq
         itIKc4x0c2xaw2fQsFsdOlbskKB5RYADWXL7SU90xSBQXTotcMMGPcPZt5mx46fdrcug
         nwmq4Q8SFAF1po5nPhKk5pUSDRMmr5ENhl2iB9/YvZzunWN4waTurE/SnJybMusDhl9+
         veCVFDq1ItfiyTum3b+2zekWfTgqLj2yH7CljUf9w9CePNM/a3JzOosk/hYLP4EnXICK
         ipUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=DD03yuVw7SjJmS6qkfXRQreMzPbT7kgxfPg1mQntqlE=;
        b=Gpc0lpZ8bClWK0NXwhtRpQvmvrpBgCcA1B7zSj8q4a7UMR7i9py8Kct7hbMFWYhIDW
         F8P2/cSV/GxiHUtM3uUx9Zl8cXNP6gQj5iKIZhPUzWsxMTGF+inp6TpibrvQd/Yli17I
         ztiZFe4I1FPY9aCzrHncRvHMi2ElVKrK9gaJH/N+Huk5K200Ps81HJTaZQVyygzAPDJk
         qkTkrRwMCC+Jl+M2cE3uWWRz4GUgPUwlRbaZvU+an/xctYRxLik4pG5PHE0MNTSASlKT
         H3NI5x7k1qt6VPe3Xzzk9AaCn3LIbjXcD9An4WxqN1N1IqRYB1PYe8cEfwXIsAGuQB17
         g+0g==
X-Gm-Message-State: AOAM5312nlLDKs0QF/V+5IMpl3z4L5HaxtL/Z4KWlt0sg3zz9YHqrPvx
	hikcP66R/Z6N/zKd4XI/RCE=
X-Google-Smtp-Source: ABdhPJzBEigoW1Mzo8ff66Xd/gz6RI3h7t0CAL+jsPpJPOUBJv6jFIH2UtTk4tvqmwHMZIuUcGf0eg==
X-Received: by 2002:a05:6820:548:: with SMTP id n8mr1062887ooj.62.1604050499060;
        Fri, 30 Oct 2020 02:34:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:54d2:: with SMTP id i201ls112081oib.4.gmail; Fri, 30 Oct
 2020 02:34:58 -0700 (PDT)
X-Received: by 2002:aca:ba8a:: with SMTP id k132mr996609oif.23.1604050498569;
        Fri, 30 Oct 2020 02:34:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1604050498; cv=none;
        d=google.com; s=arc-20160816;
        b=UvGLgrYfYlg0h+6XW2bQhN71mnGZOdjBJdNgdykPDioVGVGPhuvYExJAfMUAWuvhT/
         cx0/NyJmlqZIr/W22kDHSEy0Dsv9FVE9ol687tV7oO3miA/uw8tFdcRuTmbCKqO3bZrE
         XOiXedmpA8GmpaVv4h56tGT5DlfstQ0CEM5d0HJVIWPY8VM+qbS/cvYMR6sTmV0lOp+t
         bpWC8++74q2z65unFtFPKhVvJxzJkTF82RV0a11cRa4ktZNHeUdjH4Xko9ZnU8r2SJEq
         VKiHK4pU50LNHOifB0fgjvNly+rnYaoL7bMRDlWsLaxe3helMpRzmIJT42Nweg1C/NSx
         kC7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=kkFXRAR4oi5uT7z3dC3DJbGXF8whFlGrXOqtmQmlgF0=;
        b=k0FQhK8P8ezgWQZNYdgQBmWme2Ue02hMC977af+fmzuma4CsNU4KIK3UHVOBHPojWU
         Y4H4omO9FqdxCyPTbF75WVsbm7oYPIriRGL1m8FhDqnqeR+Awr8mg/gbapkJhmcu9s8M
         08xA2QKMbZVhMJyU2ywu9Ia0KTRkru6C0FvkeV5tRq06oZ1sUwTD7FiT3Q0fX7nW7qYo
         BhCz6BM2aJWl4EJcUI3JJqPxooGZwEAVfWPJjw0m6+eqzgYrcVay29iQ462rclZTzAjL
         y1uDlzU9d06Np+boKqsGoC1HHLJhn030hahzfT61EKA7qhq6QBY/Tl+/FSshr4aekyT4
         fA8w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=VVfQhnZl;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from out-20.smtp.github.com (out-20.smtp.github.com. [192.30.252.203])
        by gmr-mx.google.com with ESMTPS id p17si484792oot.0.2020.10.30.02.34.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Oct 2020 02:34:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) client-ip=192.30.252.203;
Received: from github.com (hubbernetes-node-69f8b0e.va3-iad.github.net [10.48.111.66])
	by smtp.github.com (Postfix) with ESMTPA id 1396AE0026
	for <jailhouse-dev@googlegroups.com>; Fri, 30 Oct 2020 02:34:58 -0700 (PDT)
Date: Fri, 30 Oct 2020 02:34:58 -0700
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/d845c8-2f52a1@github.com>
Subject: [siemens/jailhouse] 2f52a1: arm64: smmu: Enable only on config commit
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=VVfQhnZl;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.203 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
X-Original-From: Jan Kiszka <noreply@github.com>
Reply-To: Jan Kiszka <noreply@github.com>
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

  Branch: refs/heads/next
  Home:   https://github.com/siemens/jailhouse
  Commit: 2f52a11d73461f64ca0d0bd36aec27e2fb4e838d
      https://github.com/siemens/jailhouse/commit/2f52a11d73461f64ca0d0bd36aec27e2fb4e838d
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-30 (Fri, 30 Oct 2020)

  Changed paths:
    A hypervisor/arch/arm64/include/asm/smmu.h
    M hypervisor/arch/arm64/iommu.c
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Enable only on config commit

There are no tables ready during arm_smmu_init(). Therefore, we need to
hold back writing sCR0 until config commit.

This fixes DMA errors during startup.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/d845c8-2f52a1%40github.com.
