Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBWMHT7UAKGQELVDWCQY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83a.google.com (mail-qt1-x83a.google.com [IPv6:2607:f8b0:4864:20::83a])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C8D48939
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 18:46:19 +0200 (CEST)
Received: by mail-qt1-x83a.google.com with SMTP id a18sf9733793qtj.18
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 09:46:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560789978; cv=pass;
        d=google.com; s=arc-20160816;
        b=qFFm3uMEC3IJK3fN5KpNmtA5XF/tj7tdUP62r0Y/nVRG++XTRJ1jLYbN97mrDcz9OX
         GvGKNYYWcRpjRSNggad1EI6rHsS6+BSALlybkAb46p8rO2/Iswkalwhgdgh3IH345+Kb
         bikzzPZjMIU/FE9ovjKn2W8nH7tR8qac1RooKQKMjkO07yGCGbEUVmI9Gcha5mYnIrC3
         CLR98QscP9HGCc2lH+Z2ZmqXIVZ0+dcECZnr4Gk26G56E6bCLdUdZJ2VEYw960nQXZ1c
         xZLCu+NZejhneOLDUKKadDMwswy8X8LXvFnCpAB/MGq77Rs60mNzezg1Zq9y8yrS/65x
         jhCg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=DDmr5NFsHIoLsW/UmvI4nZLV+vuWBPb7u6EatfKSfhw=;
        b=KTxCr0YSEXi5jUsyyjDIM734rebXkt0q+erdMrg5WDPE07yN4ZVYdTtBTAcX+H8aFq
         LR7404mZ+eRcHcopLCe8h60yizaO4dxxyelFS2GQsT2YAnM3Z8G3ENY/J5X6H4/fx2G8
         AAHbdz2Y5reuPbIEfi5cm1tluhpIXCc22/ujKTRzU6t3FP9y6ugcF0YO6a8xzJaANznE
         YIC9ZueoILjwalxDzB9HzgnqlbbuYJazgSlNbn3IZEm0kqrhyZwjJjLW/odMMpQSPiXP
         hiCiCr/YwYUjClVbbyuwG87Qm3+v2uhcNa3XR8c3N82yZ57AFbPWRs7ySVum9o2jguGW
         5mVQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="NQM9/A/g";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.200 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DDmr5NFsHIoLsW/UmvI4nZLV+vuWBPb7u6EatfKSfhw=;
        b=sURcAbXBs2jz7JPJR3DTwO5YE6iOJ9rTpdKneVn5vD9FriAfcinob5xwrsApVG54yk
         w7f11hACQRWdGAclmYC6Ds8YYVVn03SSO2z3QZfGWx40s/2xn1MKEnGF3jUTzl7Rqxf6
         Deuwupd+XuoEEBjI/8qf2stfh0D7FJEGFa9HF89W7j/xl555I46nKTrHlNDSQBRS9enU
         4qvg56Wg5sLh/1Nxu4T2cbd6r7xEEKXedBySSaPYIBpdlFYXrod5wILIzWZnCcjga+pT
         GekVGJ9Z1ZMwYwd1EWZkdxnf9dEj5cOu8fOkWyhXDYSHK9EtLQT5uUVqx67QhlYxrTOi
         tg9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=DDmr5NFsHIoLsW/UmvI4nZLV+vuWBPb7u6EatfKSfhw=;
        b=pJdFbTEQmCjqQqL/mFR1L8Rnw0Sw82mb8kbtU7AX8JE70ZQrawiGIW8fPF/H9Pe/Uh
         vUvTtguAX5WU2q/Dzzm5TNcI8YJubMSx+4iAQfAdx11YKUQY2xPUjGvugXyTgaj5Ij7E
         y+JVkcT6vGVfGzDNXoe+pjWj2H57lSPCGfjSDOLMzGj3M0+lOSEFiDGO82fgXWt6tGLJ
         7MJDYewnUOg5bKtPOrvwc0Tn8SWk43wnx51qyAhwlP+3o7RoKjkquI8NI2AHccgEHID1
         HUeNkjyGuH5f4D/BmVZTbNndwoZlX+f2W4yxGljUSqOatQ32r+VTCymG6/kkpdfWk+dI
         CsHQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWyB5Y0/f421WbMAvmpME/xpAJVA7Afgk9EEe17MaZhozuUT3p7
	bzs9pV9OZx9suprOIYQc3lA=
X-Google-Smtp-Source: APXvYqyrgMPJVqAhzVJfJ7MHy0tbqyKDTpueMqB+lJVcmmOZwSRUurxD323YM0BK0AbLn4OxDUnz1g==
X-Received: by 2002:ac8:368a:: with SMTP id a10mr12923417qtc.143.1560789978174;
        Mon, 17 Jun 2019 09:46:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:8e43:: with SMTP id q64ls4349636qkd.1.gmail; Mon, 17 Jun
 2019 09:46:17 -0700 (PDT)
X-Received: by 2002:a37:9c15:: with SMTP id f21mr32398479qke.248.1560789977750;
        Mon, 17 Jun 2019 09:46:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560789977; cv=none;
        d=google.com; s=arc-20160816;
        b=GV92cbg2g57h4mxKipWFK2JlQZQiUcf6CmKibM9WI/0Mx4U0CxNZQrkNgWMAd4dm1x
         4KU5Zi/JX7dKUDgFM8GjhwNJsYfojCHpJlY9x0LOvwBurbpXGhZ23rmi80kWuzftsrPT
         To7ZxGJ70uUlYK5QbMpvuw1hnjFEVtjiBVHbRptsfIqm3hI7uDNrk7U0si8uPQGoSBqI
         jwALb2PqwCycTaBNnEByaN6qqT1wnZTp4zoDoV5PEter66SGKP7ebsSvpzdsNr2Era/5
         Hi/3Cpb5XyKWm7ZoK4Cj5p8gty9R5VIPh+oPTU2TqdhLLFXG5Bu8EhElB5+iVtaUy8+A
         gAfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=Jj3B+NS8phqOaVkrefbIAlHazPn8TJi5kvOvEqsREsk=;
        b=zZ09vzfixKWbhQvSYN6T5uGabM+dtWWl0DsvbKc9eqgaVZbmDf6lrbNxBEllpHZgTu
         cBdDF96NqakZW9YBPuDcCK+1hqRe6JnmUP9T9dO4rNxaMW4t9tGhNO6Q9ujC1aCQOns7
         xP26aEE4S+wsIfWRxYCrbk1SHkEknoCzMja11s9meL0B9pMvBzalNNfdXWLge+ywnE4F
         sDcznVDBMm7+E9xg9KvxqmcaTGCwgnW+Snty4jlOaBJLVFJfdxTm1FpYLRjjXS8s3sh/
         n51OfLw44cZ4FRE5dfdQuxGW8n/Dy0ub87UT5VWeuG4+AcDVY3r1qwLiprKNt3owTSNx
         rgzA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="NQM9/A/g";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.200 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-17.smtp.github.com (out-17.smtp.github.com. [192.30.252.200])
        by gmr-mx.google.com with ESMTPS id g41si714652qte.4.2019.06.17.09.46.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 09:46:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.200 as permitted sender) client-ip=192.30.252.200;
Date: Mon, 17 Jun 2019 09:46:17 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/0238bf-31f8ed@github.com>
Subject: [siemens/jailhouse] 31f8ed: x86: vtd: Print BDF instead of
 hexadecimal device ...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b="NQM9/A/g";
       spf=pass (google.com: domain of noreply@github.com designates
 192.30.252.200 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
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
  Commit: 31f8edfd6eb37f82e3e6f1eeda5a6d7799efa41f
      https://github.com/siemens/jailhouse/commit/31f8edfd6eb37f82e3e6f1eeda5a6d7799efa41f
  Author: Mario Mintel <mario.mintel@st.oth-regensburg.de>
  Date:   2019-06-17 (Mon, 17 Jun 2019)

  Changed paths:
    M hypervisor/arch/x86/vtd.c

  Log Message:
  -----------
  x86: vtd: Print BDF instead of hexadecimal device address

As it improves readability of hypervisor messages for debugging purposes.

Signed-off-by: Mario Mintel <mario.mintel@st.oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/0238bf-31f8ed%40github.com.
For more options, visit https://groups.google.com/d/optout.
