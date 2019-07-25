Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBAUM4XUQKGQEOONFFGA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3c.google.com (mail-yb1-xb3c.google.com [IPv6:2607:f8b0:4864:20::b3c])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D29746BC
	for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Jul 2019 08:02:43 +0200 (CEST)
Received: by mail-yb1-xb3c.google.com with SMTP id e71sf31067873ybh.21
        for <lists+jailhouse-dev@lfdr.de>; Wed, 24 Jul 2019 23:02:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564034562; cv=pass;
        d=google.com; s=arc-20160816;
        b=cScfKvKg7DeFvqCQc2EFavXOw74wakFDSttL7DU4iXTcgizqP8mndwDuESOIr8fO9Q
         RIi4q39a9bwc2noe05fsL+ZJdASaCeL8QV3YXpRJdNedMvj6hrvMyQhuvyYnqepFCE2M
         f93+TSZXbU5HzyNnuQYEEXdbyOkldUtEYLLTmg7vkkX+VDu/y67/cEkvIvjMhHano/ii
         FqCJXMiX5u3fM5/5VnmgX0ovrupCrD1Vp6LEJjJrqitom9bXjWkQ4Ta1WGnPaxoHPVXu
         jeOm7OcbEnQm38KEc8R5zzSe2Sv5BaWQ2O59H0Xev67ys1r4l3qqx7eE86kJyRF9wrpG
         swhw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:subject:message-id:to:from:date:sender:dkim-signature;
        bh=fyZniqmGtuMNAtoSZLqROBdfDTh4Wl5ZXho3KSyShWk=;
        b=mzvfEf4TjOp1fNQN8VyrbZevbd622SkflwHwEcpt6nIX9IlU+fh7gVCOYWQHlh+5VZ
         bjgC3ygSor26HySyGMEo49+O4W+hoDG3tvjiDtEzmm7Uwd9HKJfKp9iWnzjq7oeykLMl
         f4+KKq0mFeya1FO709xhhJRQcoj+OU/wgR1xYEiZzrnz1U2+0CcX3qNqLOED/95shTUt
         PqkUuWAH+ITJZ9d57XUL+LVy/w7si6mPLpNUmbjuPaRUglJ1EJdi/eWCaBgoHDLw/GLV
         +DUFaa2QU8cXf9Xw9aSCHDXNykpjUa0bPXE4NB2Im7JZAbM3W5OXbVev2RmspJ20FlGC
         VZFg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=m3VrGrLC;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=fyZniqmGtuMNAtoSZLqROBdfDTh4Wl5ZXho3KSyShWk=;
        b=FWvU5DXDaS8PmfI9jQ5HKJAw5R1xq4YFP0vtldazhmu7q8qt72dJw3p5VdsYNPNnH+
         pEfOPmgmsKplTEEU+cbBBo1vVZL1+1cJ6gJeVapvOQgcLqv9vmnV3nSVGsQojpbhAobg
         mm88WFMnfGHJ4v0/y0pCrGXTwM6vRO15P+mZJf+aKQS4Xyke1tRXrClrvLRlOyC0jueY
         K4cIaRU3CPjAHNPusKtozxCDDr9+lfOlt2D3nac5IhXFSgcxOWYqVBaV4PoKHvUtA1tp
         3EuFQWES4Tvw6YSPOvHZ0g34c0lxAwAKvcicWvRdj4e/ER5xI81fghENsvQulAF7rpFq
         ZvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fyZniqmGtuMNAtoSZLqROBdfDTh4Wl5ZXho3KSyShWk=;
        b=bnpgWani4XsBXXNTNIQF8z1tspOaxuDdVgEnj7jcDCEXNtt1Uc2t6vXBrRjykjsh/+
         zT2m38IjtfRUvWtfihj87AtllPO3nMSz9SSINfTVS5pUqxqRU9K4zl6IeEOjXqJBi5YD
         945wtqzJP0eiy9iZ+yoNA3El96y+Iw7xJboSMQGcT5bC0UbZuw9ZvrUgxwQQFahD6UH0
         iHfBrVyWLxTDFtZ3N121AKq1sOmPx+lvdj2Nu76jKVPjtwKm94dcd6Ycrn7yTrjfsazX
         guEiH3BlF4eJHcMvWU74k7Q/8jsIOIuuNs2UuYYjD02z2ML2loVFrAD3j5+agbFl+EMO
         wjKw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXUu/Mg7vuRgGgi5U5xcHxV4s+QiQqPRrHwaXx97AodVaeZi0b2
	+bJt4gWlPqemXyttPczO1RI=
X-Google-Smtp-Source: APXvYqy41xv9223uRrshEWriWl8OlNV+PXq1aH+KkvbRZ/iViiD1NOw4v8gA7AhLb6ApWq4ue+a0kg==
X-Received: by 2002:a25:664a:: with SMTP id z10mr33569682ybm.426.1564034562323;
        Wed, 24 Jul 2019 23:02:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a81:48d3:: with SMTP id v202ls6065376ywa.9.gmail; Wed, 24
 Jul 2019 23:02:41 -0700 (PDT)
X-Received: by 2002:a81:47d5:: with SMTP id u204mr54387113ywa.145.1564034561829;
        Wed, 24 Jul 2019 23:02:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564034561; cv=none;
        d=google.com; s=arc-20160816;
        b=0bgd3JTpZ/QWlTvnIAnZYmhgm3OZI31TX1MIa0A/yos0vvUJZ1m1v4cLUNYFtzA2VV
         ipGXSQztF/lmL9huNIphXubbxHKRMxYYReNycwZCHgEJKXjLewWYZ8bH7YodRq1MKi9y
         vxRVBH4FU9WYVgjb8LZH2XvtlsqlUtr+X9c31Xb3N+kIhm0ySPWuS0UlLFc4IAq3BkkS
         wLOATEFtw6cc8iH6mcYKthmqmLVKD09cIQu7lTKpqTDWGu8ZazipDktvDgE4XpL3CC6f
         4YZ2q5s+d/V7iPr9Tn1DqZi8HaZ8Ay03PXirEoy6aA2FnzHOY5mv6+r9TA/+ZNyZPmDh
         DvDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=7OoVrriUu8ibiQ0lxo9RF9cpiZ30MNBcGwBd9ojEjps=;
        b=qIehWGQxfiT4lNHIdLlL5MxtXwDDFMauZC6oBtzVwTNHyJvV8VeFZf9YtzLqPhNPOm
         uN20r2Nzt5TaN09aM2tyMygbs/+pwoaosH3Wi+4YqCCk9HOcW809nxEZj1slDVgzHI7Q
         2oEGx0JGYInzGDfkdVeq0ygiCkm2tEGCWjWEd7xNtA5g6zQhyNSBIthxS2eeZec3xDDv
         kQR58Y0XGjZBSHPA7WM1Pjrg5CjVfTWM1CTChXjfJuNeoYfEiVXx3lSI2LgkmL3VXV6A
         cN9CQrp7lco8FHhFEep/JN+jYp+6mGyLHTRRh+iKlAYdCkbi0XHq8dsBStHr1WWUrFDS
         saIw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=m3VrGrLC;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-24.smtp.github.com (out-24.smtp.github.com. [192.30.252.207])
        by gmr-mx.google.com with ESMTPS id x5si781582ybn.2.2019.07.24.23.02.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Jul 2019 23:02:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) client-ip=192.30.252.207;
Date: Wed, 24 Jul 2019 23:02:41 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/9f2338-e7674e@github.com>
Subject: [siemens/jailhouse] f6fef9: pyjailhouse: sysfs_parser: Add more
 precise length...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=m3VrGrLC;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.207 as
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

  Commit: f6fef92ffabab0772a6da1fd15cf12887a9600fa

      https://github.com/siemens/jailhouse/commit/f6fef92ffabab0772a6da1fd1=
5cf12887a9600fa

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-07-16 (Tue, 16 Jul 2019)



  Changed paths:

    M pyjailhouse/sysfs_parser.py

    M tools/root-cell-config.c.tmpl



  Log Message:

  -----------

  pyjailhouse: sysfs_parser: Add more precise length of some extended caps



I often run into situations where Linux tries to write to some extended

capabilities. E.g., Linux wants to clear Advanced Error Reporting (ERR)

registers when probing for a device.



At the moment, the crash dump of the cell is hard to interprete, as it

remains unclear if the access is inside a capability, or if the device

just accesses some PCI config space (e.g., accesses beyond PCI spec). At

the moment, all extended capabilities have a fixed length of 4, which

supports the confusion. Four bytes only cover the header of the

capability.



This patch calculates the correct length of PCI caps for the

configuration file -- at least of some capabilities. For some extended

caps this is pretty easy, as they have a fixed length.

  Nevertheless, other vary in their length. In some cases, it's pretty

easy (VNDR, ACS), in other cases it's not worth it (VC, VC9) due to

their complexity.



Caps that aren't handle still result in a length of 4.



Additionally, switch to a hexadecimal representation of the length of

PCI caps in config files.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: ce87a6afc1de4ffdd10fba9c92ff1c89ec7d34e4

      https://github.com/siemens/jailhouse/commit/ce87a6afc1de4ffdd10fba9c9=
2ff1c89ec7d34e4

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-07-25 (Thu, 25 Jul 2019)



  Changed paths:

    M hypervisor/arch/arm/include/asm/bitops.h

    M hypervisor/arch/arm64/include/asm/bitops.h

    M hypervisor/arch/x86/include/asm/bitops.h



  Log Message:

  -----------

  core: bitops: fix type of clear_bit



I don't see a reason why nr should be unsigned for set_bit, but signed for

clear_bit. This probably got copy&pasted across architectures.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 92c1d1d9948fd0c50d6c5bf4259e1dc9ba0b3d4e

      https://github.com/siemens/jailhouse/commit/92c1d1d9948fd0c50d6c5bf42=
59e1dc9ba0b3d4e

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-07-25 (Thu, 25 Jul 2019)



  Changed paths:

    M hypervisor/arch/x86/svm.c

    M hypervisor/arch/x86/vmx.c



  Log Message:

  -----------

  x86: use definitions instead of constants



Those definitions are used during allocating, so let's use them during

deallocation as well.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 90f392def0720107d0f0cb17f4d026cfd1c101b2

      https://github.com/siemens/jailhouse/commit/90f392def0720107d0f0cb17f=
4d026cfd1c101b2

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-07-25 (Thu, 25 Jul 2019)



  Changed paths:

    M hypervisor/arch/x86/include/asm/cell.h

    M hypervisor/arch/x86/svm.c

    M hypervisor/arch/x86/vmx.c



  Log Message:

  -----------

  x86: use the variable io_bitmap for both



Semantically, SVM and VMX don't differ that much in those regards. Let's us=
e

the same variable for both.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 53a55842ef7e9f3695649272b37eed8cec89c271

      https://github.com/siemens/jailhouse/commit/53a55842ef7e9f3695649272b=
37eed8cec89c271

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-07-25 (Thu, 25 Jul 2019)



  Changed paths:

    M hypervisor/arch/x86/include/asm/vcpu.h

    M hypervisor/arch/x86/svm.c

    M hypervisor/arch/x86/vcpu.c

    M hypervisor/arch/x86/vmx.c



  Log Message:

  -----------

  x86: consolidate io_bitmap allocation



It's pretty much the same, besides the number of pages that have to be

allocated.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: c416ff7427f11d51a818bdf8683a75f200f8573d

      https://github.com/siemens/jailhouse/commit/c416ff7427f11d51a818bdf86=
83a75f200f8573d

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-07-25 (Thu, 25 Jul 2019)



  Changed paths:

    M hypervisor/arch/x86/svm.c

    M hypervisor/arch/x86/vcpu.c

    M hypervisor/arch/x86/vmx.c



  Log Message:

  -----------

  x86: consolidate deallocation of IO bitmaps



Same as before - we can now do this in vcpu.c.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 9ad5ca85ea350eb10dd56a1994183039f5ac13f7

      https://github.com/siemens/jailhouse/commit/9ad5ca85ea350eb10dd56a199=
4183039f5ac13f7

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-07-25 (Thu, 25 Jul 2019)



  Changed paths:

    M hypervisor/arch/x86/vcpu.c



  Log Message:

  -----------

  x86: remove superfluous statement



pio_bitmap already is set to the cell's pio bitmap. No need to repeat the

assignment.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: e4cfe90d48731cf30159d9fb8f9e7283756095f1

      https://github.com/siemens/jailhouse/commit/e4cfe90d48731cf30159d9fb8=
f9e7283756095f1

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-07-25 (Thu, 25 Jul 2019)



  Changed paths:

    M hypervisor/arch/x86/i8042.c

    M hypervisor/arch/x86/include/asm/cell.h

    M hypervisor/arch/x86/vcpu.c



  Log Message:

  -----------

  x86: simplify check if i8042 needs moderation



By adding pio_i8042_allowed boolean flag to arch cell fields.



With this, we don't need to directly access the pio_bitmap in i8042.c. This

does not only simplify (and speed up) the decision, it will also be helpful=
 in

future patches.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: e7674ea7425fc3f968c6d50a2bffb9afae861f9f

      https://github.com/siemens/jailhouse/commit/e7674ea7425fc3f968c6d50a2=
bffb9afae861f9f

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2019-07-25 (Thu, 25 Jul 2019)



  Changed paths:

    M driver/main.c



  Log Message:

  -----------

  driver: Account for renaming of lapic_timer_frequency in 5.3



"lapic_timer_frequency hei=C3=9Ft jetzt lapic_timer_period, sonst =C3=A4nde=
rt sich

nix."



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





Compare: https://github.com/siemens/jailhouse/compare/9f233898917f...e7674e=
a7425f

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/siemens/jailhouse/push/refs/heads/next/9f2338-e7674e%40github=
.com.
