Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCUHZKOQMGQEALWZAVA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A6665AD95
	for <lists+jailhouse-dev@lfdr.de>; Mon,  2 Jan 2023 08:11:06 +0100 (CET)
Received: by mail-ed1-x53f.google.com with SMTP id t17-20020a056402525100b00478b85eecedsf17568198edd.18
        for <lists+jailhouse-dev@lfdr.de>; Sun, 01 Jan 2023 23:11:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1672643466; cv=pass;
        d=google.com; s=arc-20160816;
        b=uRV1dc/sy0fIxuLugC5mlRi0wizmUpZDxS/R0jKpyNHOJ+jTO7rr2QZjbnCDIdDLqa
         XD3UM+pxSl4ijr5G4ckepgJ7fHfzR2gZ4eZ5RxIkPbJQLLR7Z9RxCQN2/JseWEX4g5bH
         Opktn5tL4ZNLWvp3zh8yzXWDcggcGF0kqxTggdv2tqPg7R4KhFIAFcBi3oeD8vOnrM6A
         IdssKwHsuGpc2328G9w/zvwkaeurLTieZSVR0ffu17L6afT+kImZRlSN90FLtaqxbx+1
         wIzPKm6keWnJayRoq5K2xiwuXaNbThy50YgcHkCwbC8QN7Mmg4ls+DO8GCd4BIoYWk8u
         PJTA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:feedback-id:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:sender:dkim-signature;
        bh=37qKc7Au2euJ7LI41NGAV878H4lxmbCmZKN965nl/nM=;
        b=rY48m9TBIxyy92nLMLwZ8jKhMVkLJtlGug2thZZybI4pzTqyhpDjogGXBz+dYoozw1
         1ocrA3ObyjtApaCmvbi2w6CZeqDgd64bU9CRl8D4sLZO4SfWOd/unRrdMvQnmwipVkw1
         lNjUlvycRXPNieP1sNL/U+MeAa2lVIt7oMuBgRYt320JltdbBxZ9TAf+O/z1so6Zz79M
         Y8lx0GONfKbF/JuzJQXcQecGCDd3F1Lb7++o1mybMmR2CT62ngGSDQlauu8+vTCSdv19
         6juHant7JizQEcKCRuQ0DUznjODQbmI89cAKfYLdqQWmhDHtc5bbnPQGUadXCizK+pZa
         +/jg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b=mGfGFD7K;
       spf=pass (google.com: domain of fm-294854-20230102071104ccc7fb83c928c63544-3n1xfx@rts-flowmailer.siemens.com designates 185.136.64.228 as permitted sender) smtp.mailfrom=fm-294854-20230102071104ccc7fb83c928c63544-3n1xfx@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:feedback-id:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=37qKc7Au2euJ7LI41NGAV878H4lxmbCmZKN965nl/nM=;
        b=LW5S6utSfryHeuqxX2DPsqEgf77xNlTHySolQW8x1g3ylTGCH9cN4Ztu+Inb3yi2Hh
         H1lxDVaGRL7dBmMbRNU2iK609fV8iKSYe2JEnAO7ZzkaN6TIF2lGdMaT2w47rxApBXXd
         UhF4A0OpfdN1NjZ1NTAnedstaLPMW+QCUQsVvstFn8k0d6TdsTrwOOEAngun1YBeFF8w
         9oti6YREs2R2HGi/N+/UM9yjhcRYoxw5mVPyk7YJwXvTB5vHK325LktfQ/epy1KyW3JA
         dVFvRsAFclrF1CXJcdvjQiQCnSRibd9igIdgwKznrqVV+uclWrH+/7hVl15uLyFCGZKf
         z/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:feedback-id
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=37qKc7Au2euJ7LI41NGAV878H4lxmbCmZKN965nl/nM=;
        b=lSSoXV07cwqgpCuQprys1AbHB7K+cqCtR1+IuUGaxMN3hVrRb22WGoxB9qr+yMaXGX
         pLH//PuOcAUpkdah5ZTgUdm8RHXPU2VTzygSTjhzwr7D42Dsp1vM1v01xyeTbmokNaar
         J7cxrg062A9fDX3R/hQeZLIRXP5Oa949ly9gUVdBNixL+Ze1nvPHdhDmKO91B+HmspRD
         UzIvOVjlg3AvAArWLqsfRODahDVWVHBgrIZbcsnmI/oggluWcrzP4MOVoc4M4ohTYyiv
         0MWWKUohpXUA36VEoW/DCKi9saNZLAHtxMCU/mGgoKkfEY3kLv12nv1B+rCBMLn1Z31Q
         ikMQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2koL08hBJ7D2eHZe0vbUla18DEHiach+CET6Ckdrhj66F4CiNP+v
	w6A4H1XOwwnT5HBVdXTFFMo=
X-Google-Smtp-Source: AMrXdXsU4RpI8qBqIf/BJqGnyyy/OQMSIBZvMJFc6Lj6iJ4XUQRRz+RE+aB1DdkKfHa4IHdLS7girA==
X-Received: by 2002:aa7:d58b:0:b0:485:3523:43d0 with SMTP id r11-20020aa7d58b000000b00485352343d0mr2829162edq.221.1672643466625;
        Sun, 01 Jan 2023 23:11:06 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:39c9:b0:78d:e7b8:d105 with SMTP id
 i9-20020a17090639c900b0078de7b8d105ls2586428eje.8.-pod-prod-gmail; Sun, 01
 Jan 2023 23:11:05 -0800 (PST)
X-Received: by 2002:a17:906:2349:b0:837:3ddb:7e97 with SMTP id m9-20020a170906234900b008373ddb7e97mr40961657eja.61.1672643465158;
        Sun, 01 Jan 2023 23:11:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672643465; cv=none;
        d=google.com; s=arc-20160816;
        b=pjYqXsBRa7b18o7g8emCyRXHQJ4gUf6snYOwku5R+kCecM3qUFvZOt8Ep2lYrhrW7X
         NBViwmL2uYE0KykX8nTAYIM/kKfkedGjkXaNiJBubDBA/YdbMlYBP2uGXRujyVcE+9rG
         n5+t3DYPAQ98JNcyAOcr+ZbYZErReoq+Uvg9qQWuh+dfaE0gtr+GHE5sMbS955QF5MMY
         cPN48JfxDIqDwJXK0BAIPQ1FpHylt4atacLvjKMJ6jRRiQ0P968Y3+BAUKbWmzziB+4j
         oAoXAfCGxmuQQ/70mggx1XQmmZpDjiA0sIp7rIT7FtPaWzJShJJkpWJfouVU8TC/R7m3
         40qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=feedback-id:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=JqvoFgrPtY81LpzZGvNe817bM5AYrReebJDTYjNTLiw=;
        b=RbQCCA0ogMes6gXBrMdQtbj2fkZ7j3eK9Sy6L9S3zbT6bzh+aOvPcpyz8GoMtdeHh6
         j1KLXe2nakCVBErKezka5vU84MxGAGY2900cj4yQlu4tUufxyrACcPIGEVJINev1wzB0
         fLydvgTKssHxkKcxqvnZNoU3rj43q7F436jEGOkJYOamivAWg+Wp3yOwUk9vVjexBYBE
         YnZtTh+wOt3wj9nbjyvwrdDhLwMqoOH1ilqHr+dWbXxFxsT8cRCCgEqJnuC3tzrZv/+e
         5sFbmWJvQs+K9bT8QWe7xIGQWxrWR7F0WVaqmu9CzxjOT/rgxT0RkUQYtTLsJ5SPHcly
         rLwQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b=mGfGFD7K;
       spf=pass (google.com: domain of fm-294854-20230102071104ccc7fb83c928c63544-3n1xfx@rts-flowmailer.siemens.com designates 185.136.64.228 as permitted sender) smtp.mailfrom=fm-294854-20230102071104ccc7fb83c928c63544-3n1xfx@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net. [185.136.64.228])
        by gmr-mx.google.com with ESMTPS id x15-20020aa7dacf000000b0046920d68fe2si995826eds.4.2023.01.01.23.11.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Jan 2023 23:11:05 -0800 (PST)
Received-SPF: pass (google.com: domain of fm-294854-20230102071104ccc7fb83c928c63544-3n1xfx@rts-flowmailer.siemens.com designates 185.136.64.228 as permitted sender) client-ip=185.136.64.228;
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20230102071104ccc7fb83c928c63544
        for <jailhouse-dev@googlegroups.com>;
        Mon, 02 Jan 2023 08:11:04 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 1/4] pyjailhouse: sysfs_parser: Fix IOMMU assignment for PCI bridges
Date: Mon,  2 Jan 2023 08:11:00 +0100
Message-Id: <eba9280f25c370828f51764a3c06461af99410cb.1672643463.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1672643463.git.jan.kiszka@siemens.com>
References: <cover.1672643463.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-294854:519-21489:flowmailer
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=fm1 header.b=mGfGFD7K;       spf=pass
 (google.com: domain of fm-294854-20230102071104ccc7fb83c928c63544-3n1xfx@rts-flowmailer.siemens.com
 designates 185.136.64.228 as permitted sender) smtp.mailfrom=fm-294854-20230102071104ccc7fb83c928c63544-3n1xfx@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Content-Type: text/plain; charset="UTF-8"
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Not only the subdevices need to be assigned to the given IOMMU, also the
bridge itself. Otherwise, the config generator will bail out with
something like

RuntimeError: PCI device 00:03.0 outside the scope of an IOMMU

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 pyjailhouse/sysfs_parser.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 7f19fb57..35c59744 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -395,6 +395,7 @@ def parse_dmar(pcidevices, ioapics, dmar_regions):
                     assert not (flags & 1)
                     for d in pcidevices:
                         if d.bus == bus and d.dev == dev and d.fn == fn:
+                            d.iommu = len(units) - 1
                             (secondbus, subordinate) = \
                                 PCIPCIBridge.get_2nd_busses(d)
                             for d2 in pcidevices:
-- 
2.35.3

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/eba9280f25c370828f51764a3c06461af99410cb.1672643463.git.jan.kiszka%40siemens.com.
