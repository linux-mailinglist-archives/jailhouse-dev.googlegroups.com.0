Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB2M66XYQKGQE5VBUFHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id DA254155730
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Feb 2020 12:52:09 +0100 (CET)
Received: by mail-wm1-x33e.google.com with SMTP id t17sf617816wmi.7
        for <lists+jailhouse-dev@lfdr.de>; Fri, 07 Feb 2020 03:52:09 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581076329; cv=pass;
        d=google.com; s=arc-20160816;
        b=00eXMU4rmqpzH4x0aOXNTk9S95RG78LfWGKQFSkl2yu6LdKKgm2Nb1OkLdb9MPYyhV
         rnNIXkJn0mGpb3tCZywl96blk/XyYPLcpm1PLm5FyinvXVUoV8JBo14ctj5P4KyBbk3w
         W/gGxcD8xheCcut8dTEad2aBKkWcveM7Ghsa6Tidzyx0PaIpbluNBNQzM3UmsH74pe5r
         Dbfg8f/TNZ9DbJNhiEs2uEU6U1cJJX2JRv7TIjv04w4i2VFu9GBSN+schxdILLI5pRmY
         CXxXy+7s6wIa9j8uVNNEd/H/LRkn+CDDpPpleEI3KZlIhEDuMBxw/D1yk9EX2f//mZXt
         ahtw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:subject:from:to:sender:dkim-signature;
        bh=dInXeyajpLUFk7i535goMnEcl08Wtydo4sWV9JtUkdQ=;
        b=RYhpfkywZBaM6tnZZZHznpcwBF1c7ufdd1kEt7HqExcgtz/z/4nvWYX1rJbY7hKt7A
         HMIW5Lh2q3w2O1wnFonrw45aFC81yytH0GSdHQXiqw/51/wVj8eGn77BERqtOQzcBVNe
         Sxlj4SI5eA0MT2eDJnzWZBP3HkukjBDt8KMW0dBy9t4bj2Aq17usI7Zc5NpJbFw+jEck
         gAFlp4YE0UA34dnpP5z53NcnuSMDAEi3uAueeF+Sqc1jnKjSDIkH0z20PLmt67K3r5MR
         oBDgRewT2om05A8PQ/vYRQR9wOiGKyva7jqfNrahRrdfrJ4lY9snHz5Qeh+zM9rp/NzY
         PMfg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:from:subject:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=dInXeyajpLUFk7i535goMnEcl08Wtydo4sWV9JtUkdQ=;
        b=qnob0iX7+AioIdWZMfKVm/fh8pOpm7GBPQpYtPZ0oKW3UUOaZL1lVGc73uCn+LEnzh
         Fl1X0NZEA2u1rVWe12/uz89MgYEjHgqSbVrevh6FBI0bJfuZsnPs4dkPF6oIUOBagHX3
         93fc8ftF37yZeLLlcZbaKYWANaYDXW0iY1oJmjevDxaVnV7DPssb+DygtS58HOFTrv8P
         91LX/YJ4bJ33zVouAxLlrwQCQ0uwPMy6fHX8GhJyRCPH02P9lOiE+wAYidIOpuci0vEc
         FDDAEPXWL/dRX5zM0gizR4uUfx+WCwNCKIxZkg1FlJ1Z6cvh0rJCfkcgbnWyr6H2sN4H
         uvfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:from:subject:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dInXeyajpLUFk7i535goMnEcl08Wtydo4sWV9JtUkdQ=;
        b=WKVlFJBv8CsGnwIrU2PlG1BLA0p4pV2MpUHc80/R2A5pKX1pwYHVGQDzFQvbgEF1Ss
         UUn69xota31mNM/8GMShtMvnXOTEjgVtvu6lTfAvKgfMvxoSh4L9gGVTXCzulKIyc19V
         pZrSf7BAblebhHPiCKrMbXiFXe2RDk3R3aZLiVZ7jowGw9SyMDRvwzAuYqtEfUOLECf/
         M+TJG2QeQDtJp+HUCAvDDZ7g4Acplh0mo8cIOglKsyvqnBsz/Wf2/XfRawwTkZLNam2b
         Zbwq1Z2rm7G0Rnt/2Hw+UxraQ1UNClFUh0LeR9hcdSILRuXbdGyaHP4UWLFFcEJWMIj8
         uc+Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUJim998yCFH2QriZoVQF5fP6nHbPxJvrErsAlS9iEAeoArIbeH
	L6yh83l6GnrMauLCNlHmPGQ=
X-Google-Smtp-Source: APXvYqz+gqb/Hv5r7/eYaNVmG5pzXUi6pKuraqAHxY4Rx6khzpvn9dHqXM4skLWQBYpmlC10/R9F/w==
X-Received: by 2002:a7b:c0da:: with SMTP id s26mr4012005wmh.52.1581076329559;
        Fri, 07 Feb 2020 03:52:09 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:ea84:: with SMTP id s4ls5693279wrm.11.gmail; Fri, 07 Feb
 2020 03:52:08 -0800 (PST)
X-Received: by 2002:a5d:6451:: with SMTP id d17mr4477874wrw.255.1581076328783;
        Fri, 07 Feb 2020 03:52:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581076328; cv=none;
        d=google.com; s=arc-20160816;
        b=pi9SsPkIceoaT6V6TWVvhx7waZgJYOUP2rMLL2B7MJFpBrQK1FbYE1tv4z7TWLeLqK
         t7Q65a3hNEmj3rrVdOpr8sGZBx9JxJPQHkea/fO9ZWROhYMMH72ZNGXP2YSbp6UZQFW/
         2Ns/wg9j4HiA2LxRQT/XaKdpk5/dqpIc0bJ+96xVphqXIHfsKlErUrP+hDW6S1TgRSgG
         ucuMGytnyMo++eaXc9DE7DpsFVc9JDrijlYNohIwo0ZOV/qALHYwwgxLZLQoz5pWWIl4
         ccW7N88rsbCiJmcPhEDFlB1DUWld4gGQXUiUdJnSVSf1TkwNM2ojdd3wDHc7XvOoQbvU
         bSBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:to;
        bh=S/3KUJ0C7Wu2/oUkH+7Z9ct9IpE6V7PzbBd+In40UBI=;
        b=KYACGrXOcdsmZwhKOaKmKXlEMggNIaxaC7iEmltOSNb516Ww63WVEfAiOqq3ZwFk+n
         HALOIVZ4703dJE/+wFX36Qs+Ku3SmMET+6EJsc13MFL/wGp+vX/iwj4XdigLsbXUHPMf
         n0nyHT6bebQyaO3+bVRwI2Gjf7aLWrEvLsocwx6cIfV3yaYROZ7Qo5cJs8PXLtD+bU47
         /ddY+4dvnwzRz7iEJzwrTOPl6ljcMhvjO8wbJkeVJWuKl4SdPcrHpyR+FvtyzgwZxXEf
         L6tWmYa/gnK52BaBb1EasUrJczqiMeJ8ugIPvj10CImnIcFpBbvzBPo2NQaWh1jHDF7Y
         DNxg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id i15si130756wro.2.2020.02.07.03.52.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Feb 2020 03:52:08 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 017Bq8Gr010174
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 7 Feb 2020 12:52:08 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 017Bq8YT019522
	for <jailhouse-dev@googlegroups.com>; Fri, 7 Feb 2020 12:52:08 +0100
X-Mozilla-News-Host: news://kiszka.org:119
To: Jailhouse <jailhouse-dev@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [ANNOUNCE] jailhouse-images 0.12 released
Message-ID: <22b9591f-7202-bf2b-cc23-e9d37b12241a@siemens.com>
Date: Fri, 7 Feb 2020 12:52:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Hi all,

this is the release of our ready-to-use reference image generator for
Jailhouse 0.12. You can download the new version from

    https://github.com/siemens/jailhouse-images/archive/v0.12.tar.gz

then follow the README to build the desired image[s].

Changes since 0.11:

 - update to Jailhouse 0.12
 - new board
    - Raspberry Pi 4 Model B
 - add ivshmem inmate demos (note: bare-metal config so far available
   for QEMU,  Orange Pi Zero, Raspberry Pi 4)
 - switch to Debian 10 (buster)
 - switch to kernel 5.4
 - update to latest Isar
 - update host dependencies
 - build fixes for Ultra96 firmware

If you have questions related to this project, just drop them here. Same
in case you see problems or have suggestions for improvements.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/22b9591f-7202-bf2b-cc23-e9d37b12241a%40siemens.com.
