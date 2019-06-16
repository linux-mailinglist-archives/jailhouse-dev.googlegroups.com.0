Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBU5STDUAKGQE33UTWWQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E434743C
	for <lists+jailhouse-dev@lfdr.de>; Sun, 16 Jun 2019 12:26:28 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id u2sf3293097wrr.3
        for <lists+jailhouse-dev@lfdr.de>; Sun, 16 Jun 2019 03:26:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560680788; cv=pass;
        d=google.com; s=arc-20160816;
        b=OgiaSJfE6zTggCd7Ej+2XkmJEd+dTSTSj27B7Jogm0fLR+nuhG0AzJS+8twSEgqlHa
         w9drNoR2P8zoNl9VzveXtZ7YNdSO0/mvCrRfWGE+b8c0Zl0L6Un/JnQcM8Oa6mXzsG2b
         d86E8XQG/AaX7pgtNTk1zQNnXHRNitrPqf7xNkRUKUByCnf29G9sZqk4jS9BIFAk/Vde
         n3zHKv11AcF6EnuqxQdCrIAe8afD+cV27jdJZBX2Aeri9YKQA157AyRbpa3Tl/7R6ZjS
         2WGquTMp/7JpSmjrLgVNAsnqGJ3DJpZBvjEP/ApW3E1Ch/8xymGYoZAR9j+FlRB+80dX
         p+6Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:subject:from:to:sender:dkim-signature;
        bh=lHJ2LIlGPVLZef3z/VbLwSKxwjQ0m86vsyvB75qTUa8=;
        b=A+CvJL71gsrzx6QKAUCZT2gUJ3MCvZKQaO4vdZaLq4a6zJgzLS5Z8HvWbJsNfDyeF1
         nsAzarZDcN85wTH9xz/hkBKr/xKJqQ9ZuNMRRcTO2FIsw0t/zFZEMmJat34qYdpatRcw
         39bs1Aoqh0N98OVYf+mALIITkCq8zIXCf/OKa3tO88FPsmWonbDKvXLmJVhPFMnydNDH
         Vd61kshTybN5iZOj8ohiNRd5bwiCy9QfHaaGKHpNVQ5zfUG0SGf9FSFS6P2l9VCqRJDK
         xvSJ+wndEGFnQhJhfoWEySjLL065b+lo1m7VDNzk7h7WAM8sqbeNFjHxSwmsG2s75iRP
         fFKA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=kb0q9N3o;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:from:subject:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=lHJ2LIlGPVLZef3z/VbLwSKxwjQ0m86vsyvB75qTUa8=;
        b=IMRIeR5X2zEbUQRmkWHesmTlfF3DSW+SD9H9kvzDnQFxCATpYoXLcpqTXU6og+zOuj
         7wksF3xuZ0j+3WHAWdV2ss9jUc8BMb/w3AMWoXMsdbYGLwYX5h6kGZYN6/z05TJ74wzU
         wSU2n2qOdwnFeK5khtIg1scilecCFwVADdfCNLqX2OgdnLh2wVOFsRpHmg0+gB9elgJM
         HAZDAHgHS7w58uZgAgAjrTbK98V/35AAtbPhzyiKx6/z9pZGxKxAsB0vXNaGpWt0HGY+
         71geB68QCfKmI6YFGYJFuQDWEBNSmm7+SYKpmPI5n8wOiY/0f2ncfCNjVpGTx/WDNny9
         I1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:from:subject:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lHJ2LIlGPVLZef3z/VbLwSKxwjQ0m86vsyvB75qTUa8=;
        b=f0vVbJhQu67X6NzxO5DLReSW9sz6unWmFw23ZaQp9KUlR/EWGgA1esYGvt8irrU3wt
         th5oRjkN1Ge/3DIjmM4v1B2EI+y+W2z8C3ooODHUCmCegpNiLn0KyhvYeK5DtndbydoC
         sGXTjAb0wlTBcp/sedz85nPOmwItRpmY0eMPaEAf5bzCWufzqst/6+sbXUkd08SAluCH
         vCX7eFyAX5F+gT6dO+gJ725xbWzi8w6gmXtw9T8rRMankP5mix5Lpas0sBUu4b/wETIb
         0gEYFWnt9WCS3l5CQ+iZ61IkXEMKUjtPBeUnzQEZR7XLzB7MBpuqACp2tLbSLlxd3Vsg
         VhZg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX4POKkkMBhUTFYrNGQftQWyurHyty1RcugcLea/OY/Gu0aEEAg
	7BdQtplmv6X31AwrzxVLgVM=
X-Google-Smtp-Source: APXvYqwTApQUnVdRktvF1zAEvyTPrdr1ilWco45cPbQFttAwXxGme51dUDmEA3wAV0vm91T/BmLAzA==
X-Received: by 2002:a1c:44d7:: with SMTP id r206mr15184661wma.164.1560680787899;
        Sun, 16 Jun 2019 03:26:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:ab4d:: with SMTP id r13ls1994138wrc.5.gmail; Sun, 16 Jun
 2019 03:26:27 -0700 (PDT)
X-Received: by 2002:adf:a509:: with SMTP id i9mr61744294wrb.269.1560680787153;
        Sun, 16 Jun 2019 03:26:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560680787; cv=none;
        d=google.com; s=arc-20160816;
        b=UVZTDmvA3CbW61W2nT+oK6LujLGmS9CZQ995g69zw0NxZJSiX88f7u/09AhzN6PwWQ
         tN5SXcy2Qn3fUpw0YgxdfX2O5FvK/OoZ9s/U9iAWacKU6EeaKLLIOfbxV9ZSTooIWKki
         JShg+s03eTw2TBaWrGiy35434iQmBoA2OyXz29mWkO4TjPE/KsE9tw5lhOXbyQHhTiCz
         rGbp42VGfIexbzODt1aSeijj3CRIBOXON51KM7ODdDAvoVqFg4Bot9mwBzWlZfhIkh1U
         lrQMetZDnCka5rr4HPvWO3vO9H1KnelcJmEbF+cIQhnyggQmRz9p6o5lxNg+ngt+Gu4F
         /5Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:to:dkim-signature;
        bh=BV/G7cERFiYOFXjmhE2862oXckFu0u3/3E3a7cxZhvk=;
        b=Vhb7PTq3g6OvaLdndqLuz9YRS14MgOCBZtvVX90r3c3KTEMEtNEnR4XoUog0o8DUk3
         CxZifbs2LsIFfyeLFXQdPo8DQkwuu+8Q5cZEU5MHdl5BkJYXjZ4euVpPaCC9sOIgo4Iw
         3yqqTrTnDon/lhtK/8zo0AJVtmAl6Qfqo4pnloPYBzDQaGY+UdZIAIADyDMILxc9LsVq
         WHrRSSpX7qzk1gjYL9menCZK6IfVjMShUNT3VpYm1p2iMYTJjZO2l+nUq3FhV0l4c4HJ
         YKQ8LA90NgA6geV0YS6JHWobTAX5vJRseKnIy+JqDlYZ9HGA0QDPZD3bk7lK5td24BhA
         kDsQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=kb0q9N3o;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id n10si468262wmh.0.2019.06.16.03.26.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 16 Jun 2019 03:26:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Mb8xf-1hw2cT39sh-00KglN for
 <jailhouse-dev@googlegroups.com>; Sun, 16 Jun 2019 12:26:26 +0200
To: Jailhouse <jailhouse-dev@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] x86: Avoid duplicate arch_cpu_restore() on failing
 arch_cpu_init()
Message-ID: <fd0212fe-ca19-ad8a-b932-96c0da90df91@web.de>
Date: Sun, 16 Jun 2019 12:26:26 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:khzOkW56ofBvTIKd/+XKS9xIXYJjC5k8tVlm+EAMyw1UFgZtBvm
 5KA/NyipNa6yCTtjYjuvs/3Cel1OnAdX9i0rLE5L5FjGBSifb8nfHGiqKOwJQ50a5nnOtD1
 i9gen0BO4AxI+RzkHlIiNLuHmig1pwleJQK0WPsVFQ8JDRKeAVajYG2BDkXdPETymsBMGgE
 jz9DaQRH0NAand7GJF/Rg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OP41RY1LIHs=:yTQjf7m0A2iTSWqua7At4c
 XBVetbMF/HS5DBxZeRO+jrkpRFMHq7SLN+RvDTOB8tjQVOAn2Xa+uUOjHaavoOZfuTjXcwD63
 etcyWD0qEV8uN3w0QpuEOE8ZhwLq5xvcBpDohD/DkJ/ap8UZNvyAEgg6mzaHDByv9TN4eXbTH
 xUMsWmk7143TP+y6aTfvWDT7RriROtSYbJW/S3NlqwHARUeWhvzJpc/xk2qPEhSbIykjV12cO
 veNjpja+7Qfe8vx+dlUJ2dhtA8TmktBePGGbUYZuLcQJhRf7pg460YH80LhsS3MY23cAgdLJd
 nqXisnz7nFMRYaDsyB/mfDnE4bzERCITXJF/TmE++gwvOAMo7FgUc52DWJviZib6FcyY2LLfm
 nTapYUDx3ZLaqEu6GpBKitye/3jpm6MHHKLoTSg1baF7276FLjFrWgfbMaZ7vg5DfyElv8B+e
 CN9IFWZWbAwwyJ1WEXLYdv4bbiG+DWZG+NFubfgAMonEnbvFCeU0+UovKdr93A6Sxeqzrelux
 Y2zcddfTh+VXUUA+V5UK+goVfCaHtMErWlaC6b+z04tSxbFXdfP4mkq4dIw3WzUfJuiJrnwCl
 Z2cgybbtIwM69JrFxt5TulHF92gIswADws8AkYYUTkkICQvujHhsWGd/DjCBVXl5uz1R9Af8v
 WxC5NSRDTvsLh4Sb550UkmsSiJMT1z8PegoVVMZu8Ndd1vyCjfJ5Ui8YE7KTSq6ZzJytFiqWD
 mlLr0c/dy2364SY2rW47LRo0p+8pmCxXtNeAvnjv0gxgaJCraduJRWVxbiKpf7MFDPJoj8H3k
 P7yhHux3+2kNUVLuWeJyLjxIA/EAy7hO4EQznKgCVXqEOx7JiBXsjjVRBRo4BDIr8Dj6Rykc+
 Tc2+aQVTCI+PVH5oSseIVobw4y7nT1ZVte2PHSuGWdtMzDUKwZnQPl7ilAQkA781ksIufxweN
 obcJAjQ1mvzb5KH9C+tElxJmlLGBfcH7ZdP9GIF1gZdZgMZ+ZICTI
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=kb0q9N3o;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

entry() calls arch_cpu_restore() when something went wrong. Calling it
twice may have been harmless in the past, but now it hangs. And it's
pointless anyway.

Looks like this was wrong since day 1.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/x86/setup.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/hypervisor/arch/x86/setup.c b/hypervisor/arch/x86/setup.c
index 9127aec0..6f0be862 100644
--- a/hypervisor/arch/x86/setup.c
+++ b/hypervisor/arch/x86/setup.c
@@ -197,17 +197,9 @@ int arch_cpu_init(struct per_cpu *cpu_data)

 	err = apic_cpu_init(cpu_data);
 	if (err)
-		goto error_out;
-
-	err = vcpu_init(cpu_data);
-	if (err)
-		goto error_out;
-
-	return 0;
+		return err;

-error_out:
-	arch_cpu_restore(this_cpu_id(), err);
-	return err;
+	return vcpu_init(cpu_data);
 }

 void __attribute__((noreturn)) arch_cpu_activate_vmm(void)
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/fd0212fe-ca19-ad8a-b932-96c0da90df91%40web.de.
For more options, visit https://groups.google.com/d/optout.
