Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBIXPV7VQKGQEB37PZRY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3e.google.com (mail-yb1-xb3e.google.com [IPv6:2607:f8b0:4864:20::b3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DF0A4ABC
	for <lists+jailhouse-dev@lfdr.de>; Sun,  1 Sep 2019 18:53:56 +0200 (CEST)
Received: by mail-yb1-xb3e.google.com with SMTP id e69sf9987983ybc.11
        for <lists+jailhouse-dev@lfdr.de>; Sun, 01 Sep 2019 09:53:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567356835; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ntn32sGSSNz1E4z8otkbC8+vCmSf7B7Au19pnh82fb5qeFVN7kgmmLxe0v5apUW44c
         PKfvkJWTKnGK5486Vvw7Dt8bC0AmYRCKAmONcf9X3BnwIhrO9TJXUrjFkhmtA6Y79/i+
         o76o45juety2jDf7spz/I3B/ae7gkrKxnqiI2+GqgAj9LWrE82Bg3RVQKLrtmfdevzXp
         Vk+FADxqsxVEMFXsBTkcKhLMOihbvJALsfHbppBAu1UNItsiWF83UjcQWig41MxK9TF1
         jmqMIMqaWnhoSLWFEJDrMhUx26djOmxjivEXtF7kR+r3mBsAb2Kkloya4tN60oU9CylH
         J0Mg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=Y+tYdn9wjJ+GTEzHZN2rTpEnHR7fLAt+Mu1yamDZNFU=;
        b=Jju2r6FKOuBFCESLp3YlmF9qApvHJ9EosD7aCv1s/1SJJC/yS58msL1VN2PDi6CjrU
         AahqVcO7MztmfZjWOrJ7WyrYc1IM3TVx5LUimNOYLCkLtL17PHQRNFnfgLQPgQFjPtms
         oW3TiFzUlyfJ77lP9Yrq/HM2uwtkGXr/6jE5NnYugURXqtVwXSmRpQOnYjjWSbQLc481
         DOg7Vl5cEM61c9EkElIVSv2p9pSh1TnYfbfiYozdgvq/Y8Z3M/JSyUIqR27h95j4wXxT
         kLu0n5A9gG9bQY2JmL+NMKB0nL+earSGFms1gcuMOksN5QhrqrETzXxOBjHfdan+GDsA
         wATQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=rIjnuFTV;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Y+tYdn9wjJ+GTEzHZN2rTpEnHR7fLAt+Mu1yamDZNFU=;
        b=IBFWW9Jxwdtq+COhdBIFn91gMDTGKTET3a5W85IL2FC+bN64eNpOAj+YhMLn02o5e+
         dYtwJdZvQ3vVbXayjAwMw/PCQIPVrZFv4Tk0ackIOW+hc8LJdmHErIdVPAqJqhDWrQsD
         UNwYz84U6wSLfbOlb58sycXVm4kHmgYU9l07Fvu/qFCUvFR9uvmEBEs+ObPnfCEFygGv
         f45Hh8lC/v9BAChYVarrB0OYhwiG3LK+7wBvIHm8pyWDytuHkECwhNos1u3awbpURpbi
         qwxbRyXFx2DIqomv2ITiFE1MFHfOE7bAg2dPZC5+BOAcdomziUOn+QRSzJN5zVPnwsK0
         ZsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Y+tYdn9wjJ+GTEzHZN2rTpEnHR7fLAt+Mu1yamDZNFU=;
        b=Kv1SRiwkCc0comEc3hAvDTKB3PrEOfxQ4752SynW9LiS5QiF1xRab5uXwDxDAG2FYO
         X9AfGsH2swktNLB/EOkGoXxCnHsSqrfmZdyW/yfFKVxm+6fILIwTR6r+2eRuKrxQpT5s
         qMI9d4t+9f1fQ4oDzcOUeodSQgJJp+pQ0xYVDVv+stZsdTqHh3WFQM4VPQBatdcnSYhX
         DtNJBGOKFrGWE3DERuux0PZcQMzwf7lDHPUK04QAiMpd0CGeuVz+4fnJ1a64IpswvwK2
         7tUm/R0ambXQR+Uo7Sds2fiWQQ1obdyexPGBe+TSHKaOdLknNtn5t0uT3i2qbRZ3+M6q
         rJ6w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUbuJgaMxuXdYu80IPdapOkJuACPVQN1G5d4vpIdN2xymIUqCNA
	FaCgv3BXzSr8IIUt6nj9Kvk=
X-Google-Smtp-Source: APXvYqxtOd3CEHoiNF5aYN6r8YfEYdV1mKVQ2l33D7nD2Y7+ckoeU4DnJzH/2eHtLOorKJ8EjpWzCw==
X-Received: by 2002:a25:aa22:: with SMTP id s31mr17847254ybi.244.1567356835052;
        Sun, 01 Sep 2019 09:53:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:be47:: with SMTP id d7ls1396559ybm.14.gmail; Sun, 01 Sep
 2019 09:53:54 -0700 (PDT)
X-Received: by 2002:a25:2692:: with SMTP id m140mr9555744ybm.74.1567356834571;
        Sun, 01 Sep 2019 09:53:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567356834; cv=none;
        d=google.com; s=arc-20160816;
        b=yutsn3q4sqxMlVdeUzuqRRY80H3WKj+w3jkR8PVolpqRAxbCrg/IbrmyB17KNA9NKB
         +mFVKn3L3N7HTFjwc6w9OILYaV+5k1zRwqTxslAXqqp4SIJbgPApo1V0xPmirAoswFYR
         yfVEYI7yV6aZmn9L/5xZWD2WmHvyAoLTTyp1d0Mz72MDGwVHEHs7vq/4rBacxjmahJpQ
         yW+0+NcAQQQQKvuoFu0wJBDiRiWug3QZbq/erbYSlRHt8rfMjR/FyasTuGjiBMlnlvNb
         NrCgN5V3dd60goZ+rFZzZ4Iz+Sz2A90fl6/yF2B12cpWXW624k7qZNI7761v9XhfBz6z
         HHmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=ksWDK1KjRPVa7vn6q4bMMeqf8Pw+5tYo63XZIntfUj4=;
        b=fNt8QwPmtMxBq6fmPTHZHJZuwhgiOna/0C4obhOy2NY1p+LGmAwjc0QYlbmclB04BZ
         ret5a3PU6Xce5e5LdIScF8vWJw+LfVuf6uZV5nmFUWVUgEzREfgq6w1DsDyx1gM7ht+5
         sO/M+nqShDpg1QQ/0u00FshfYeRKCIFxOUVZQw3VBkjIisExGO6Lyoc1w0YghatOJPef
         /QCu/Cy0cLZpJRsLh8833EPHWhROW6p4vYcPcvkrvRsl3WcxIAAJ8XKPp7jcfSskGlwg
         5ZyTYoN3SOA6JveEsIq32MZGHZeb/o34FBdn7L/Vz1GxF0E54PMJwiVHx1hpADj96BTZ
         EfcA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=rIjnuFTV;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-20.smtp.github.com (out-20.smtp.github.com. [192.30.252.203])
        by gmr-mx.google.com with ESMTPS id f78si77062yba.1.2019.09.01.09.53.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Sep 2019 09:53:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) client-ip=192.30.252.203;
Date: Sun, 01 Sep 2019 09:53:54 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/253253-ed7c7c@github.com>
Subject: [siemens/jailhouse]
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=rIjnuFTV;       spf=pass
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

  Branch: refs/heads/coverity_scan
  Home:   https://github.com/siemens/jailhouse

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/253253-ed7c7c%40github.com.
