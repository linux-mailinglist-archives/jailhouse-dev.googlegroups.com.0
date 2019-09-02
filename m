Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBGPBWLVQKGQEV2KXTMY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73f.google.com (mail-qk1-x73f.google.com [IPv6:2607:f8b0:4864:20::73f])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE85A4F09
	for <lists+jailhouse-dev@lfdr.de>; Mon,  2 Sep 2019 08:03:07 +0200 (CEST)
Received: by mail-qk1-x73f.google.com with SMTP id o4sf14866804qkg.11
        for <lists+jailhouse-dev@lfdr.de>; Sun, 01 Sep 2019 23:03:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567404185; cv=pass;
        d=google.com; s=arc-20160816;
        b=PNvTUFPQnCiKEAYqxuKl/MBAgLeF5JCEuoF+2sEkeWczp6d/5mQioKXVveuYpwlZhD
         q8uuODFxY1nwJsHW7ubCRlN2EmQZOyU+7Hwssd9loJH10PSnhMxyoak9kmya1fA8hNRb
         MkLqLZMMfqJSrt4NAD9SVj9vmtQk5RtCuzbsR72QKayDditz/ukU89mM2msZ74HbnRBg
         aCURdlbYYbWMfCPZVFMTYoMlqBbioCb+twR1mVrR49qzWp9bIQNsuex5F+QZDhF9STqy
         hEoQSgGrn/3N5sIYUcELiOhA8bHkVBOtbPhxm7Z96cKGTckTLMg95Glh9AW2Jv2Yw9d8
         7CPQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=vDDNM5hCpYH91ujHqgcA7wzixa/P1qoSVYuI4fZHQLc=;
        b=xTAiYXdz7099nVoQWSvYNBd9OorJSjF7+cnSL/1uh2kn49zV/aGHPK3Kd2H0IbJfxj
         wBQ/ZKbjVcVQ26N2BdomWL4FfNWcG8oZ1gTByLlTYpYsdKZFq27PxoWJaX8C/RLoHpmh
         NXa0PQTXEXahtXN2/lmTAh1Lvv99Cd+y2REij8j8ybnGvfronYbKIPKfBCiDGsWxvDQ2
         AS+cK7531AhbMMs/OIa5FXtQQpD/0M92Xdd0jXRAkE65QHHgG2gkIQWVTQrAe/L3PHCY
         X4QQLY5GtxI78uqIcQPDN6T9UMgSAK8E5FldYuBmuTG+CgQsaGWDlvxIocjwnmnAGrfp
         805g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=LL9ryADl;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.200 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vDDNM5hCpYH91ujHqgcA7wzixa/P1qoSVYuI4fZHQLc=;
        b=h6oRmIDUbd//nyyQa+RVz3LNDfLgGHDYuB87nbtFEvYODIQKwdEcrr2ngadSW9waWL
         tcG++0UhMJtqCwYqy1sHMX/rOwT4Ifd4MwVCtC2lTXrUKoH9UUfd4W3/bU/8anhma358
         7R5L7voNi1Iade2tp/IYoCzGcvs7zUPez36UZi+2V7QQhbvv2Vd6jyi+kFzQjm8cSofO
         jeFPZxxE6Olc639MUzzo4ebmPzvV2gsAOwSRCWaloayqad4IYL2uEcGWYtPlN6jEYBO0
         3BIoqYpa8DZ0KJS0WFTvs8NlGVoKyrOp4LKsgNT/TC8CKgb4nDJzPgMmUrabA04+9c7c
         MPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vDDNM5hCpYH91ujHqgcA7wzixa/P1qoSVYuI4fZHQLc=;
        b=XpX8MPsPE6DRt74R8j7ME8pwaACdfKNaTMyMxXJc8z89ajHQpYZvTwSfPfqtJRqtPP
         mwIItykxXR1lCVHcMzHUNFp0ncGzWaNOcD3O0mVK1iAiyOOBJoqN5qhrglV0ODSddBGF
         Yu8R9wFdG0jHZ3T+1iIgPh1jp/s5Tczuz4jKyKj3qoh3wsdaR1rdXkD+Nt8QlKzjdlf9
         3AbBOaZKFbbt0drZMAquCibk9RyHavQC+t+qBrOG3c0Y4vLpbJaQALZSWbsftZ49dZXe
         CkQMwbt1aCjgHlAaCD5QiN6N35wVYbNDdZuKpw783C5NDP6k+lQxwY71qr/00i0Ti4j9
         i+HQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUF9YJlapR/HeJFI7m6agi7Jvgcf8ZdpGYyPokLqqp08wcxXgJ/
	WjLk/5MT5d6u90A0l/vCf/E=
X-Google-Smtp-Source: APXvYqzAgybTPfEjHSczphBO8l8uvaSe6hIHYl1/y0Xsfw9FZ/H5nyZujm8iT7KGa0oVvDjcg40Lvw==
X-Received: by 2002:ac8:609:: with SMTP id d9mr26840382qth.290.1567404185673;
        Sun, 01 Sep 2019 23:03:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:af2e:: with SMTP id i43ls1270111qvc.14.gmail; Sun, 01
 Sep 2019 23:03:05 -0700 (PDT)
X-Received: by 2002:a0c:d84b:: with SMTP id i11mr17504967qvj.86.1567404185275;
        Sun, 01 Sep 2019 23:03:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567404185; cv=none;
        d=google.com; s=arc-20160816;
        b=c1Oip1nHPSXLjPMKnP4wHgyaKH8e54rr7nbl1v3LV3qKG2UcLfWP6nWZxXgBQuyhl/
         EFWwTLGeyFD3zS1xFPuflgOe5RTWfSYnjQCaBtAGnc7C7Uub2PxL8PJAd2yQ+lfj4rFy
         /Z7RTr0EG5pjVC5MJmZolhNXmJgMIox38w+n1LpHMs+WNkRLCthSnRbFvHEnaqwI0EnV
         9XcsszVZ/g+ZF2U8YJzTcxxq4Uyv1TwWax53yfobrdinOsls/VLGTvwgmig2a1TV0YBo
         DyLdIL5TaZH78tST+mZXnWDjcXMA1pEy2sY3D5a5f2Uveg3dMI8IPZydw6UMUaDWpRqY
         O8sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=GM7PvgTxp7IxajqaCTkkZjGUh5Eg/M9eSv13JYPS+5s=;
        b=0AcI7BkZQlTWNA4Wcp98VEFQgR9mmsbzNxJqv5MPSHJlPQIA7QmYpCOsgIFFSuyPeu
         Lv2mN49YRMXViLKrLJYO3NYIbiMWJcOEEYciI1xvljK7zgaHWg1U+bbTYI0H811Y7Wpx
         VuvAkmPlI1u3v+yk/tusCBnOiag/qmpIFSbzLAzShvJXEkcy4izONXHA6r/4/LT9woTS
         j8c+ImGgDB+bDfphEDTv3M3fGhox7tE3N28OBtb4C9+dRQ1pNlrtKiA392OeCJLC6uIO
         fcT2Sho75v49+gEH+qmNJZeRmfC0nYMIiwjXpH4cNFcvCJKs6guTr+JDhWAtzDmJFN7P
         BkEA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=LL9ryADl;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.200 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-17.smtp.github.com (out-17.smtp.github.com. [192.30.252.200])
        by gmr-mx.google.com with ESMTPS id l12si168605qkg.0.2019.09.01.23.03.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Sep 2019 23:03:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.200 as permitted sender) client-ip=192.30.252.200;
Date: Sun, 01 Sep 2019 23:03:05 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/ed7c7c-955a94@github.com>
Subject: [siemens/jailhouse] 955a94: ci: Update build environment to Ubuntu
 18.04
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=LL9ryADl;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.200 as
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
  Commit: 955a9418df6edd88cf0f4496b029312df0bd7511
      https://github.com/siemens/jailhouse/commit/955a9418df6edd88cf0f4496b029312df0bd7511
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-02 (Mon, 02 Sep 2019)

  Changed paths:
    M .travis.yml

  Log Message:
  -----------
  ci: Update build environment to Ubuntu 18.04

This allows to switch to gcc 8 which may report issues earlier.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/ed7c7c-955a94%40github.com.
