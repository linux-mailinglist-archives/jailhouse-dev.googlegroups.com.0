Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBNXPUHWQKGQEYUVDFSY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F3CDAF9D
	for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Oct 2019 16:16:22 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id v19sf473269ljc.15
        for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Oct 2019 07:16:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571321782; cv=pass;
        d=google.com; s=arc-20160816;
        b=jqzUEKGK3/5Q7htc2YZ1Aj0JyfhLhEfAtyUri7s2etDQul7DN/Dm/K/R1LDBrJVnfX
         NfPrWPocCM7Hk7DMEnr6upuyZNvAdia9ANYtHnTLdCmf+KR/l4LeE6dLKhavqxfhGB4w
         tTAU9zHluUKAMrtBMRUfvZRArAzMyV91/KEJFK/xEr8p0ey3EHAWun08Ke4Y4tA6/5Sx
         F6G7o/UBiT+3AaBxTt2cWFaHpwCecZ3IP492+qvr1wEwliZ0Di7EVtz5r2irYloyQbw/
         1g/rDM0pjqmbYLse7L5DEPzaxf3P7eGu9OY87ZviXVvnbPmjYsA6KAO6g71aNbCPFIVp
         jYrA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=dkg65MO7pqCR47EFNR4ppioTtL1TbihqacSXFHSqi2c=;
        b=yaCLXM0nImNi2803Quqg0V+TGDBn2LPsdBKo3gMEhRFKVVN/tAbRtrpHDN3Byq+Z8O
         X2wJBRtI2I/kMcNq63mTGYHCRAcD+iTOygK2YlxzHyN3H0bjqJTx8l4vhHdjulhurkQe
         2/NZTh8wY30+7W4SSMdCQoRjmu9Jjlb+8vE97BFNUqT/kkE5F5sBn0ebvPGW6rolsp5W
         3y/uL1fvsXfBP7OPL/ycpQXaH9YmI3DQvu/A1+6Uzcns8/LV5A2Gsy0KUVAa6iIeyZEm
         jcnWozLW9ZW4cS4EJkmsaLQQ9TZilSiQpjSRtD+hUEb3sAv2w94yjsqcFG6wFQ6ftZiF
         K6xQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=dkg65MO7pqCR47EFNR4ppioTtL1TbihqacSXFHSqi2c=;
        b=jS0n2GuGYeG8lwzl62yCYdSKXi/v4mOVCr6aPKxm9GEHLdLUiCgKPS59YugRGvWXpA
         5hcjiBpvWBUOGXg7ZrugdDpJUD8fVdv4daoLH2LZ60UQHLtGdMt7S8zXLdxfxAB5z+MV
         SrdDcpLhfPD1/5mq2KA6dv9myUXMqR1qxJD6g7uqLInnieSWx/tH5xTXuWe1R/xgz10X
         4K0igcg6henNWH+al2UhAxqHBZQTxDNRDB7Gq0SBoLLbhZxtEK0HM68/aPR1vNx7qtbO
         ai7HB/YwYn9JzpmZrTnYyeFLvlRo1j9OGpcX25zvMWPWmL9zvdor1vND97aQrewCEDd1
         krqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=dkg65MO7pqCR47EFNR4ppioTtL1TbihqacSXFHSqi2c=;
        b=bVDjH9zODkKgMDcRb2sBwKMPz7HFUGeQf79klA0ocTlPetNi4+h6oeVZvH3fkqTm8f
         C4TBK1YXeXDpEO/+fXR5sTNSavZfVKh2LpljIbHoK2SrCYW8waoLh4zB6MQz4eYunr1u
         eB1J4d7THoYBumQQrlQCnEfQdS2pKTYWwOfXWP81bweOSFrhVZiMZkzsl2cqx8x6P0sW
         4f7d1pABA9WUV3cBNnAoHBltXEgAHJOWp1Y8bP8tLT8bNkESnXqvgrkEshAZ0i22Po7/
         YR6uyFazdkhTJ3EW5pINEPPgieEhb+K3OBjVzR7hhJBEOFuVq736v9q9caFtYPcOLjiR
         6b3Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVwHRhKia121wdlU3+CXfjzUazXHKg7MrdfGxjY0oGP6mPNS6RU
	XN9MP+vGzncna1RJZWSb0+g=
X-Google-Smtp-Source: APXvYqysskdmNY1kBOtt7Iofz8blJxV8tsJAM1B37tgm1CXn4oNPayD1rVFLcRMhpk+M1iT23oUXMw==
X-Received: by 2002:ac2:4435:: with SMTP id w21mr2482496lfl.43.1571321782324;
        Thu, 17 Oct 2019 07:16:22 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9d9a:: with SMTP id c26ls316827ljj.9.gmail; Thu, 17 Oct
 2019 07:16:21 -0700 (PDT)
X-Received: by 2002:a2e:9e85:: with SMTP id f5mr2798017ljk.203.1571321781605;
        Thu, 17 Oct 2019 07:16:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571321781; cv=none;
        d=google.com; s=arc-20160816;
        b=h2lf7k3CYAeW8E3A+SnPZ0QiXcJ58K+lUbUr2iRqdtBZofjP70G75iwTnmoZ5hevXa
         V+y0/Yh/g15r0WRLieaERBjrth7/XK1bttyL+8iL+cFa/ltn9AwCFqTpcpBQMs6cRBUb
         NJMVHJaRiKQlWgIa3oNAc84MYu3VCQ+lw785rJluynKyDMtDYoQVVizqhJsO/tPsHFxt
         vjhgtI8Tvf0P15n5fiK7mWW+VjYq0y5l8pWAYuL1XWjO3dR6+VruMEyWEJImjyyx39nN
         sOYdnpKo1fGVY+S3B3MrJnFUWDNEcCREYFiUlX5Yfwn9m2Jy6QWA6Pswt3QfWtEIndis
         sTcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=vlqQcMm4wS9Nn2HcEhyM9bo4w6M1JkDWbBMsaRMHOpQ=;
        b=FhicELHsKbkV6FFXbEOCudr3tJ8S3j20bUThsGqTscH4qHOJVYqsiXUH90wg/X4iwF
         q0v4YosbXcHrRaG2s6OyvLawU+3RVKyNQSOl1OLT9q+5o18MH24ZE1qOrjwCga9z+vyt
         ZFXycCHzknUAQwH2kwQtTMzlU7ZbIzDn3dCzv6r3Nx+rmw/Wt6JSST1X6afmjj+vZ9W2
         32wfpjDIxVEjk8kqF6Z2TpuuOk6oPrhBiWU9ARffUVxAqqIG6Cx54yRTjkaP8oH93PIf
         qoxVZBEH67O6zOynP3NMVjwKpsLyfOBWPQnusv01I/zrOWf0oKtTV8tj4imskjSGcsnt
         AMWA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id y6si116020lji.0.2019.10.17.07.16.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Oct 2019 07:16:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x9HEGKMh023267
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 17 Oct 2019 16:16:20 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x9HEGKgm007087
	for <jailhouse-dev@googlegroups.com>; Thu, 17 Oct 2019 16:16:20 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 4/4] pyjailhouse: sysfs_parser: Raise an error if get_cpu_vendor should ever find no match
Date: Thu, 17 Oct 2019 16:16:19 +0200
Message-Id: <6feb4398b561374baa36dabd7b1916d85e4de095.1571321779.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1571321779.git.jan.kiszka@siemens.com>
References: <cover.1571321779.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1571321779.git.jan.kiszka@siemens.com>
References: <cover.1571321779.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 pyjailhouse/sysfs_parser.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 330d3322..fec17bf9 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -652,6 +652,7 @@ def get_cpu_vendor():
             key, value = line.split(':')
             if key.strip() == 'vendor_id':
                 return value.strip()
+    raise RuntimeError('Broken %s/proc/cpuinfo' % root_dir)
 
 
 class PCIBARs:
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6feb4398b561374baa36dabd7b1916d85e4de095.1571321779.git.jan.kiszka%40siemens.com.
