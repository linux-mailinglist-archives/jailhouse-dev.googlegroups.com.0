Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBW53RLUAKGQEPKGO6ZA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x540.google.com (mail-pg1-x540.google.com [IPv6:2607:f8b0:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BD144B83
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 21:02:53 +0200 (CEST)
Received: by mail-pg1-x540.google.com with SMTP id 14sf14464293pgo.14
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 12:02:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560452571; cv=pass;
        d=google.com; s=arc-20160816;
        b=dIF2QRg7eRgR6w6Af2DIV7q7Sn8cu2aROJUKNNyrgiD775wu02tCRsKeiqFGhQRja4
         23g0ytexfGQu5KQlIZrdASlqC4DA+i+qN2cSmUSdmCDlAQ22qIyQFtajNNQOZFPNYXyA
         UQ64uFNvLzZC5jdCEMF/CVwD5i/kuwMWDQLzsM9M4Gp2Tmeltvm0ECZWoFtaio6MpSww
         7O0R+K4RCbbG3iLgEMmwkaGvnoO+dsUpQg9m2hacZoXXySfb14QHYAmPBAF+D1j2OE0Q
         PUljpzQDTVQ+CoHzf0k/8J76JWEMHNmfCtQjnI5eWLCtA8M4A4p5LYD7cgQv2nMF1G2K
         MruQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=GAMb0rIrT4wqCuV7TOrVfgQ21HLmwN/tGoymXV+YZSg=;
        b=PKMKSCzU7ZbujbPGQCkNFwu3f/QSMGQu9QaPC04+UBer7ubJ2nuHItUmbGjl9e/CVT
         Ua5OxV1cjevYRTmg1XBnx9oIl16jDKu2tyvh/hnvyS/YkEBvnGeSrQiNe2NdAKeYwIB1
         Qe8QkTH5BlF9yBudkiOqUxO6+vku2W0w1S2tlm0LE95bQbxQRTITngghUFNOkDF8a556
         DhRC7q2T82SugccpAgwJVBXD3ihtZhscqaMM1FokW3WLAtVYO8EKZpHCVKP8JBSkFqkG
         Czz6aYhD8sAxwkocWyrNe7WLtLGfIIxBMFdw7iKWd5vPWPytzUt4WjHRrlL0HTMH7VFr
         3N9g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=A9dxvD8h;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.192 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GAMb0rIrT4wqCuV7TOrVfgQ21HLmwN/tGoymXV+YZSg=;
        b=s+CyDm2i9FUj4IQ95niE3zbPAUUeKmhtSexG1jrQmEUKC6+UO0GHdbtPxGp6F1GcX8
         x4d6pp+EaQ6RxgoCIwjFpaapIyScpSce+ZrbFQYDFES20cX/lykrk13OawAV8Z6YEJGo
         ToOqdl5aUxHeqi6rJ9kN6NWpnCusfzYI2iOKuSGMJ4b7UMTG7oXWs2irG8L6SXSHXuFW
         9Ija1CDE+FH1BY9UZvW9F6OWhFbpIg71Vs3ua4aBfP+y370PtxldAg9+NZ7Tc05x0JBY
         0x0BuF+iCZDCuX4GR4eim8/j8jmKnjBtqRMAbyQ5vXlaIYFTQ7pnVGYZlHV2UOB3U7fm
         KDtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=GAMb0rIrT4wqCuV7TOrVfgQ21HLmwN/tGoymXV+YZSg=;
        b=Q2XyamgUjW9O0Hsm9W0VcB2h67Sv2thGaXnYfzIZsALePgmG0tVf6D3JYaELuahJiG
         gyM/OzU2hpcZw5PmUr2z6gADTxFSZDeX7y14oCK/bxkwTN0DBLk3GoXGDoilqwuiNUGG
         06VK/gFJMLJ6bNAjh1M/Lco3zbJi3q36xSYjjJ/BjfOl/YBvo9qu5zQjdqytxhxUEXbc
         4yADKixrERbaBVHTT3w9vWCMPOh4Slf4UBg8naAl0LC2j2Je+81ZH5V7ztahjX3aSeiS
         AALiD5R+3SJOKFhQxNS161SdeoRJwuC348BYUPai3BnLpRolveAEsL8z7DPDnLmjLUbo
         OG2g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUATi4qseUpVu3419nhe9sFKGWCliyX2iQ9z27yVwwgDi8kDcCd
	MWJp5uTztB3w0wdT5hhRBJw=
X-Google-Smtp-Source: APXvYqyuYzf+qvz7EzirBPjnmRF8TZATezd8cG7Lzd229y9spWruciIjckMdG0ZUcempimPnmKhTMg==
X-Received: by 2002:a63:81c6:: with SMTP id t189mr31445895pgd.293.1560452571438;
        Thu, 13 Jun 2019 12:02:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:c015:: with SMTP id h21ls1428941pgg.3.gmail; Thu, 13 Jun
 2019 12:02:50 -0700 (PDT)
X-Received: by 2002:a65:62c4:: with SMTP id m4mr33019315pgv.308.1560452570721;
        Thu, 13 Jun 2019 12:02:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560452570; cv=none;
        d=google.com; s=arc-20160816;
        b=kNZ9jeSGk3yXrEm1xFRsgyevhZKur8EjXgG+9ttb3rqZuAopQr6nkAchWB0qWiZZK6
         PMmLt7i2hPHEUeO43tx8Z4YXEEXSUiIydc8F/IXVwTxBN6Exqa9hBll9S+JsWgj8SI/b
         KK+v4LUhRbSMz9Vu3V8yWy1vENQ3yzGSP90VLn3gWnIs/lDuopLCDlJ48JxgXCekzEcU
         8IJzjVTobWCfXXTLSyduRpiD9kO1HxYaAdEZ7vmhUoAJePCKgBc4CZq4rx+x2/9kGS8A
         eBQC5Nj8Ro15B1aUOpn09Du5Wv65lXZp0fjqHKM31fBLoyng9XmQ3+dMb+2GVNTetzxF
         TvXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=aRn/HU+W4lfnk7VIwQlDiQvgbsZQeVdC+pabp2v1vGg=;
        b=DpPiQlFPcb2oWlpRfZVvgquiNXmuKMf661VPG8wpxa4S4GXt3E57TcqxImjkX6WoA+
         sw2AW9/Fq3cL7Vc2ZEJhZ9Aq3rAiVAeNOL1vJV/3W95lf1rGE1r6Tmbm4rataXAl+UMW
         ZpeZA8ceDQZw8OJ2Y6Bsgx5Uz+PhijmwbQgMD5s9tykbGoG784gFu0PVzmDDzn2qYJ1K
         1PU2qe4CiQm3MlWNqvfWP3E+o+DPqjVRXDADgauM7I9ezpiy5DjtNzgz+pfngcYFdiY+
         0V8oX1P9HOEVyI385IEgXePvBacFFtzBfGiTzlRTfDcbtWSgpZmVvUL6C0ICdwCwq0qD
         sFmA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=A9dxvD8h;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.192 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-1.smtp.github.com (out-1.smtp.github.com. [192.30.252.192])
        by gmr-mx.google.com with ESMTPS id l16si223023pjq.3.2019.06.13.12.02.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 12:02:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.192 as permitted sender) client-ip=192.30.252.192;
Date: Thu, 13 Jun 2019 12:02:49 -0700
From: Ralf Ramsauer <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/73489e-23766c@github.com>
Subject: [siemens/jailhouse] 23766c: x86: mmio: fix preserve mask for
 instructions with...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=A9dxvD8h;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.192 as
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

  Branch: refs/heads/next
  Home:   https://github.com/siemens/jailhouse
  Commit: 23766cddc2c5fe7e9a5cfb3db430cd14aa5315c2
      https://github.com/siemens/jailhouse/commit/23766cddc2c5fe7e9a5cfb3db430cd14aa5315c2
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-13 (Thu, 13 Jun 2019)

  Changed paths:
    M hypervisor/arch/x86/mmio.c
    M inmates/tests/x86/mmio-access-32.c
    M inmates/tests/x86/mmio-access.c

  Log Message:
  -----------
  x86: mmio: fix preserve mask for instructions with zero-extend

movzx is a move with zero-extend. It will either move 1 byte (0f b6) or
2 bytes (0f b7). The destination are lower 8 or 16 bits. Zero-extend
means that upper bits need to be cleared. The definition of upper bits
depends on the destination register.

We already have a preserve mask that allows us for to clear or preserve
bits when emulating the instruction. In case of movzx, the preserve mask
only depends on the width of the destination register. For the
destination register, we have the following cases:

  - rax -- instruction has REX prefix 0x48 (rex_w set)
  - eax -- default case, no prefix, nothing
  -  ax -- instruction has OP SZ override prefix 0x66
  -  al -- not possible, and doesn't make sense for movzx

Now, rax and eax have the same effect: Always clear all upper bits (IOW,
bits 8-63 if access_size is 1 or bits 16-63 if access_size is 2).
Solution for rax and eax is easy: Simply don't set the preserve mask at
all.

The fun part is if we have the 0x66 operand override size prefix. This
means that the 'visibility' of the destination register is narrowed to
16 bit.

In case of a 1 byte move (0f b6), copy the source to bits 0-7, clear
bits 8-15 and preserve bits 16-63. access_width ensures that we only
copy 8 bit to bits 0-7, and the preserve_mask 0xffff.ffff.ffff.0000 does
the rest: preserve bits 16-63 and implicitely clear bits 8-15.

In case of a 2 byte move (0f b7), copy the source to bits 0-15, clear
nothing and preserve bits 16-63. access_width ensures that we only copy
16 bit to bits 0-15, and the preserve_mask 0xffff.ffff.ffff.0000 does
the rest: preserve bits 16-63.

Once this pattern is clear, the fix in the hypervisor is straight forward.

Amend existing and add new test cases that test correct behaviour.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
[Jan: minor comment and style massaging]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/73489e-23766c%40github.com.
For more options, visit https://groups.google.com/d/optout.
