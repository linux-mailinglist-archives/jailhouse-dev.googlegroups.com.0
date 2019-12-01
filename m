Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBBEJSDXQKGQE576XOSI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43b.google.com (mail-pf1-x43b.google.com [IPv6:2607:f8b0:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DC810E2FF
	for <lists+jailhouse-dev@lfdr.de>; Sun,  1 Dec 2019 19:20:55 +0100 (CET)
Received: by mail-pf1-x43b.google.com with SMTP id e62sf8482677pfh.14
        for <lists+jailhouse-dev@lfdr.de>; Sun, 01 Dec 2019 10:20:55 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575224452; cv=pass;
        d=google.com; s=arc-20160816;
        b=alYjdkSlJu9P0to3Tx/AZ2L15TB7nWEV2eHn/d4nghEvdjhgshWd7fMQuR6jokQC0R
         QPSVmcPamZNq/T8cqQuKxTVonh78bYG5k+aC1Gfpe3nAVvUNFfVchdPb9AmJzPQ4OSqX
         Pcbs9WHErzU1ufhp3K2wNCSPyOk+tcJjdy4Mk45bexitLyfAS14M5fPzlFi1JSXWcFb0
         mZmxEXicbeC5fDQuNop0cEuhWT9hGqyFln+x145Y/eekLOP4Z91OOSGqj0uH1m7cPn9b
         w4guD+nXcqKFeJsLha3lkH7ajiWKk0/sQMGIPFefRjSlqemVQqx7l0wzW/kqoPIQL7Lb
         WY8g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=Mzo9eiLQggLMRRGZcG04RC01qA6o8GIx/HXnAEQIJzI=;
        b=pSZMQOl2370K0hu6VTH/kWKNDsN74xVCNsQVJQYE2RL3zOVKaZaXgZDZxsW+2BaxyQ
         Vfnhodj3H5H/h2fQB4nAIZeKTP2Sque8fg8FH6+WvGd/MG1cyJFacpY7RRog4J67lshy
         SANbsfCUUPz0CmEQXrVlRCvCrs3vfcTWNFtd9TGV8xxfnAtHA2ZjHihwSahh1CviI/VU
         VNG6jDl4zHU2E4Td4V7YklFAMxaEoAan5YGcr5h0MYWsduK1iLCRm2tVR5J11agAn4CQ
         iHzUDPR/nFk58Ca5TsmluQRn177PpDeYjakakl0cIGeqKm+4vbAx8lwffFac9VJe2Hse
         S9Yg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=1nvpLwO4;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.197 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Mzo9eiLQggLMRRGZcG04RC01qA6o8GIx/HXnAEQIJzI=;
        b=ndULkcX0JAqZESBHp0fSR3KrNcSz5zO1zusVJYSrB36mhiJyUqUnl7zddkgVm8X2iw
         S2yt69VNbD3lGMeP+3xNVrwEo6LMsNnlScRdl8EuGwrxCVpxH8puoFT03KNxUbiCx2AI
         oKlBmxxD+IBPzihUbbN5U79E7/3a1XFIe2YKvoSNOGR692p+EA3NF17zHG3dzZR7ubxE
         kehNISt3ORNpnKurPPcLn54t5II4RXPwyV9w14TW3rI4gnu+v8RAQtJHvIxxiOBesKrk
         06MfaAaJNL84Ff7PkZKU/QaA+Ib0NTEBnHTd5+kQ3osPz9x37XQ8hz9QQ3tP/wopLQ0b
         zlsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Mzo9eiLQggLMRRGZcG04RC01qA6o8GIx/HXnAEQIJzI=;
        b=MnlWGUhGd9vpHZhpScvHD1bmdZpqBljq5NXHcSs3x8vACnksLhwHhvZc+tztLZ1nRh
         GvlbxXmjiFNi9TdMIb3JS3CyJnnpUTVBvu1+iGl0iSFJsq5T4OvPEOhZJiPjTCJTDQfT
         L/mMg7lJ1WF63ktp2uVu1Afy0XdNtz9a8rKe0IZIHZcXqIgSdTow5/UUy8B4X9SP8ERC
         To3OGHhS+MQLh916g7ZZwzOYUINsf1+NSjAacj567c7Y4CYg8o9q7+fExxilzbO66m1d
         kjcmwu3H1aqWXzI2BDYlUlu+KTDqD9quovBJcmCdgj3+Q/VJNIO8EKWtv56OF38lVQ1P
         3a9Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVejYjlBOinZbQwma/azBsaU4d07cmCXJEIiqWwpAncpSqvmk71
	qAJ18rk3uriQjE7hKoXB4hw=
X-Google-Smtp-Source: APXvYqw0PG5eSKwGPCiBy/gOUj1AQfDTap7q9FCK5B4JrjEfls5AtZFBZpFmtC1iZNRWmN2O0JJDjg==
X-Received: by 2002:a17:90a:a00c:: with SMTP id q12mr7753795pjp.102.1575224452445;
        Sun, 01 Dec 2019 10:20:52 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:2223:: with SMTP id i35ls7362121pgi.11.gmail; Sun, 01
 Dec 2019 10:20:51 -0800 (PST)
X-Received: by 2002:a63:770c:: with SMTP id s12mr28570220pgc.25.1575224451647;
        Sun, 01 Dec 2019 10:20:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575224451; cv=none;
        d=google.com; s=arc-20160816;
        b=bHmpI+AbS5xWHTVrnTqygIha2Ib1FqssLcCYJTD3TWBCIdJjhNHjpMHXRVD9FBCZ0D
         z6WS5cC9clVOuj4A6bWN77nVC0yxmCpLVyYw9LaWAcRRqO7CuZj47+pYORE/2/YpIYJ6
         Zi3bx9pMCnBwd0mwS7SFoSUFlI/6Rz7cGnd7PHLBrbMCNtPS4JZ7iRDj8/8LOcEOll3i
         UBJJpIVsvoPkrsOF4XZMdylwwTomvjSWd7TW+k4cNhokuDLr3aEvP+WpYRKdm/hp/g/R
         F1OzH8AHdOAWVSNIAogllwsBahVFm+zMXJ+VU6IZr6lynOzyUJtGm7z3FdkfLUbUM4nb
         hd/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=Zsruae0gaqgcx33lJzPHAEoCqE1rVQAek/3xyJ62YzE=;
        b=CAeqbSngotFSQ8ymNWvgQPV9ztfYHjdHFQXhHswg3R8GaJTrKky1fKH9htlnhg86+C
         8PymxuMudbj+F/H72DqoVZI/nx7daIWJceZEObwu8F0WqauwQGIAww7nHyFmKwVCS7T0
         KLHZy69oUklX1sZzU+9EQXuK8q0TKecczUcpRtP4D+jms13YXQ2l78LvlasJSbkVtuFd
         yJEbJ+9229Jc6v+JK4BYzg7ZE6ciGb0KENyJbzESCvfW0OI9CrfBvw0ljd3CYWzltS3J
         cEjGTyWZw/s8GSLrMidevwQjP4CbnbDinvQbklD5VSHyL0r8TK0wdDendCDQr9TeNZEv
         BiTA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=1nvpLwO4;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.197 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-6.smtp.github.com (out-6.smtp.github.com. [192.30.252.197])
        by gmr-mx.google.com with ESMTPS id e17si428084pjp.2.2019.12.01.10.20.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Dec 2019 10:20:51 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.197 as permitted sender) client-ip=192.30.252.197;
Date: Sun, 01 Dec 2019 10:20:50 -0800
From: Ralf Ramsauer <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/2338c0-cd140c@github.com>
Subject: [siemens/jailhouse] cd140c: tools: jailhouse-config-create: fix
 python warnings
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=1nvpLwO4;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.197 as
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

  Branch: refs/heads/master
  Home:   https://github.com/siemens/jailhouse
  Commit: cd140c5a6d858a5b23bcb3dffd55876817aa79d0
      https://github.com/siemens/jailhouse/commit/cd140c5a6d858a5b23bcb3dffd55876817aa79d0
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-11-25 (Mon, 25 Nov 2019)

  Changed paths:
    M tools/jailhouse-config-create

  Log Message:
  -----------
  tools: jailhouse-config-create: fix python warnings

Python 3.8 complains:

  GEN     /home/ralf/jailhouse/tools/jailhouse-config-collect
/home/ralf/jailhouse/tools/jailhouse-config-create:230: SyntaxWarning: "is" with a literal. Did you mean "=="?
  if ((options.root is '/') and (os.geteuid() is not 0)):
/home/ralf/jailhouse/tools/jailhouse-config-create:230: SyntaxWarning: "is not" with a literal. Did you mean "!="?
  if ((options.root is '/') and (os.geteuid() is not 0)):

Fix it. And remove some parentheses.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/master/2338c0-cd140c%40github.com.
