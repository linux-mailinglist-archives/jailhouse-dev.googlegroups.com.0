Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB4E5SHXAKGQEX4WXXDY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43b.google.com (mail-pf1-x43b.google.com [IPv6:2607:f8b0:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B5FF3563
	for <lists+jailhouse-dev@lfdr.de>; Thu,  7 Nov 2019 18:05:54 +0100 (CET)
Received: by mail-pf1-x43b.google.com with SMTP id j2sf2245785pfa.8
        for <lists+jailhouse-dev@lfdr.de>; Thu, 07 Nov 2019 09:05:54 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1573146352; cv=pass;
        d=google.com; s=arc-20160816;
        b=nIbFsEShx0ZOBD3QYB5w34xI9fwhHMkkThP+xp7g6U6iU9f7/7nrXRuOUpEu3Fx2lM
         9FZMgN/HT2Ed+CiwG5j/+b9+VnC+BnFiJ8k1ZtRf3EfwWedMZLWFb8ysPUPJi5MFIEfw
         18X0zKmzheTA0qs+suo6dpeu6O1a+NBu7wac4d1tlpMXFlNWyV+UkV+61NjjR1//mTPs
         KOyt41RAOmiYIA1+7itdWiD0TzbxF/gHQ94HOUF0VLvJKJa1liSvK/YqKPCxFVJD/qDK
         RpENKYCoKPja4IYV9brpSrQbj7bDACCHURlDaHDw29VuASiIJQtWMaXd63M87bSiX/Cl
         LX7g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=kuvncfcnhm9goHvQtcH0rsmyOlpGloZEiMhjO3R8NyA=;
        b=T0s2GLV9DnG3NEc4Jhyzba0kppC0Z4In5/6HFbNiNPJB7jdQnmrnT4jUD6ixoFBB45
         PMfVJq3IlUW6hvkQ51SbtCgjuZxn8knal6dYB3o4DvInHXiR1AZzZPRYVrKOdQQSbn7m
         wIZaxfugUzfPt68zHiMeqHnyikgIzPqnk8VSwPBAzlP52vbsooM6qJN92rvEFB/k8TPu
         nyW6J2Xl2YSh23hw0oOOgftCynbs9B+/DnaGWnxnPpqr49jGimFRLTw+A8oR8LgCrrA1
         +kuI5s1eRPFl9SD8azvTYBA75DP6FEBHdx09Jy+YabHGGgptv8CWWQH3J0kfUBSKZsMQ
         9kCQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=zCrT3JFA;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kuvncfcnhm9goHvQtcH0rsmyOlpGloZEiMhjO3R8NyA=;
        b=ZujncmJir9ysEwUeblXjzx8l5tKEPA7yKPqhl44ppZ4ZG64zsEEv1j4NICUbtBdz8s
         eAFuwyzJhoCiaY7fOESH94eY7xrl3NtQUnejOW2h9qUXCAsD7PlMHkbW4sX8tREuiOk6
         1VlVcRYDXh0Du3cM30OZAA38DD3Ay7On7PWJmt+S+5Hksa4COLPhqwdMuOSWDON3q+9S
         LPifOr6ev8rj73SMP6lOumom5g/P9QgcIewhADKf7r21q5vhoYrYUjtZA0TEAY6jRh7w
         m1nmZEuuPAmI352spPn22xTKrBjdS9nMvWApBoHAVgv2sG3I2Li/u3sTJb0D6Ki1PC1c
         /PSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=kuvncfcnhm9goHvQtcH0rsmyOlpGloZEiMhjO3R8NyA=;
        b=BtSB/ugbfauWqxUVhrqxtKhdzKPAjzKrIyuNYiX/5kdhJxgKaEx/LXyS+34zCCMN6Z
         PvEK941zwhsab+vlu33OmlyApCkSnzBKqsx3eUs5xsqGc10ucwN7SNoqrad7+iNrUDdx
         pD07lRCxwAFg6oC8sVRC2X+vp9UEPXS8Q7La/q5wU0wMfz6eU9Zyi2X2/UCMiNwwhfZL
         MawDrTfHEoAuvihGek9kR8pceAr7zJXauFhn8PpNE/EDQMXF2jnpc+1GsIhntmAt8/np
         0zW5zy6PjFyIgGhm5zpM0uyWnDViRrFDneNKKbJdimJxPKCC5MwfFSzYCd+CIe0ERDre
         xXeg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU3KCElZkwyboSvIcPH8KSZzDoyTCNxknWlYzyWcgQTB415zsdL
	lVkhg/inIBzZu59cpZr8uzI=
X-Google-Smtp-Source: APXvYqyakXiriNTVlb9o7x58eks+MmH08Qc86PC3KzqYsZI04wfkFXwv1TOcHiiAOloYH/ih1M7z4g==
X-Received: by 2002:aa7:96ef:: with SMTP id i15mr5188887pfq.242.1573146352609;
        Thu, 07 Nov 2019 09:05:52 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:4458:: with SMTP id t24ls1520493pgk.4.gmail; Thu, 07 Nov
 2019 09:05:51 -0800 (PST)
X-Received: by 2002:a65:4489:: with SMTP id l9mr5975878pgq.106.1573146351831;
        Thu, 07 Nov 2019 09:05:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573146351; cv=none;
        d=google.com; s=arc-20160816;
        b=sNPmTGvS8tFfKTfvej5Pv8eDVn3DtjIkc0ZZvaQ4uvPKJoUJx3mWzjJBoh+O86CnpS
         J0I1bKKKxU0P4iB5rV371FBj4mSLoueJZr40YfASA63a4s0cxwxBy1CP2ZgEOtS3BBCe
         uCgUHafA6dE2iFf5E85MaCZ8g5319Pot+fAzZK1YkAxs+g69OgzXMVrMXY7oc5oGT8Wk
         ANSlUtSoN8jhek52HczWJZWN/jzGWe51PxtKMNLOSjlAFFJdHBAcCVu5vpCF+INWnLKQ
         BIEXvTb4lD/+54r3l/X5OfJy5VR//GF2NwaOX3CHTPGiqqn2SbG05Pq2mgZ32aFBbne8
         9/Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=pex8CaON9Id8FBmb3E1OsHeM5gm455cDnp+fa0zO74E=;
        b=yD1EY+QMYK7mV49K58MsfZNzCBqNAg3H+leSlk44tjK9hcU1LDIWuHzfp7W8rcuP5H
         KpTQJP2eDFhka+gTW12sqfX0UCFB5VHmqGcYRJjKUMtBPh2r68HZuXQPt3LR24mAvwT0
         Ga80HlEg26Eiq+x47sZtMiqq9skdbenT0NoIRRrvdG0cb3wrcAjgF/enc1s3+RniMQVy
         eILGnv4oUOAW2Hi3FwsYZFxuEZzfh/k4ZQ4UHfUGM8bWbqOym1+vQhfcz98T1A0eANps
         AQEcaVA7GaCK8B/lkW0DqfyjpmZzVqnKCFYVVPrHjozx4FTNboLcfDxF34JqeRtkOnPt
         lt2g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=zCrT3JFA;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-20.smtp.github.com (out-20.smtp.github.com. [192.30.252.203])
        by gmr-mx.google.com with ESMTPS id u17si114946pgg.1.2019.11.07.09.05.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Nov 2019 09:05:51 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) client-ip=192.30.252.203;
Received: from github-lowworker-a6a2749.va3-iad.github.net (github-lowworker-a6a2749.va3-iad.github.net [10.48.16.62])
	by smtp.github.com (Postfix) with ESMTP id 08FCF8C1E23
	for <jailhouse-dev@googlegroups.com>; Thu,  7 Nov 2019 09:05:51 -0800 (PST)
Date: Thu, 07 Nov 2019 09:05:50 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/a179d0-bac03e@github.com>
Subject: [siemens/jailhouse] d6ea1b: tools: Clear KBUILD_CPPFLAGS
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=zCrT3JFA;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.203 as
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
  Commit: d6ea1b6078602fd2fcdf7869cf3efffad5d42427
      https://github.com/siemens/jailhouse/commit/d6ea1b6078602fd2fcdf7869cf3efffad5d42427
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

  Changed paths:
    M tools/Makefile

  Log Message:
  -----------
  tools: Clear KBUILD_CPPFLAGS

Required to avoid that any settings of the kernel leak in. This breaks,
e.g., arm64 with ARM's gcc-8.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 6820b515e9a71f5490a36d2a5041e21ab4ea1e4b
      https://github.com/siemens/jailhouse/commit/6820b515e9a71f5490a36d2a5041e21ab4ea1e4b
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-03 (Sun, 03 Nov 2019)

  Changed paths:
    M hypervisor/arch/x86/include/asm/processor.h

  Log Message:
  -----------
  x86: Permit root cell to enable CR4.UMIP

This is safe from hypervisor perspective.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: bac03e4d5f5479933f1f5d0fbbc3f7aa6c4a0570
      https://github.com/siemens/jailhouse/commit/bac03e4d5f5479933f1f5d0fbbc3f7aa6c4a0570
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-04 (Mon, 04 Nov 2019)

  Changed paths:
    M hypervisor/arch/x86/ioapic.c

  Log Message:
  -----------
  x86: ioapic: Rework and fix redir entry programming

Currently, EOI of level-triggered IOAPIC interrupts may not work while
the related entry is masked - at least with QEMU as machine and
PREEMPT-RT as root cell. This is because we always overwrite trigger
mode and vector information when masking an entry.

Let's use that issue to rethink the programming pattern. The new one
works by still avoiding to map while masked but writing the entry with
an invalid remapping index. Furthermore, a redirection entry is only
updated in the IOAPIC on writes to the lower 32 bits. This is to ensure
its consistency. Writing higher bits happens first, either out of masked
state or with the identical value.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/a179d0791797...bac03e4d5f54

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/master/a179d0-bac03e%40github.com.
