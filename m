Return-Path: <jailhouse-dev+bncBCCMB6PY3AEBBR6D7XUAKGQEQOSTHOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83d.google.com (mail-qt1-x83d.google.com [IPv6:2607:f8b0:4864:20::83d])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6266081E
	for <lists+jailhouse-dev@lfdr.de>; Fri,  5 Jul 2019 16:42:16 +0200 (CEST)
Received: by mail-qt1-x83d.google.com with SMTP id e14sf11086qtq.10
        for <lists+jailhouse-dev@lfdr.de>; Fri, 05 Jul 2019 07:42:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562337735; cv=pass;
        d=google.com; s=arc-20160816;
        b=Yh/Xc2VR6XxJT7NUmRV2/H9uMHs1w7F57SJAb1RYEqZnfhOkOrgihvM2DqZ1XxvFmi
         IHXhhjrZlUrSWErohViI9Qr3bsNyIbCtRMJbofpLoWpknrAwfKztxqOd3OXoXO/c3kVB
         TQN0YlIc6167/7eA3j8U3SYPO3n4WcHTiLG8wE6DZ1DrxEUJTFud+EXBG+JQZdfiiDw3
         zM8pqYuZoBC7F2GWkvKxgS69spjLd4HXVrhABfjoAVoqO+sLnWuiDsBW28PXPdEocjr/
         5lwiHfmqiYf983HWi8LXiIqUse1o9wYKX5ZlXUe37HZHzKqZx63pzFGljJ2I4s9zo6J0
         4IMQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=cUzYaaZxBPla3W3l3T6PCv1VC7W8MU7290x6HiByBzI=;
        b=uhVY7cP7Z1yPFJbyb6jjh8tEp9g1tnyw+wNQZyUiVQi+Q7qKQey+n2oSXCMk+Pu33A
         6cqGdoOAkWVxomk5KzzUfgXsCA/3Rx7/dfGKraWojflb6vVdKEvG10kz3lI40SWYu8Ji
         2Og4+hvBc/zkke/JkSsyzX5kFiBt9/KZu9ceOdDKu9JGZEQ3Se5obuEXfrGag7Rfiwei
         RLAzKi6rszRyCJInXFG2zBU9RCROdIUsZ9n6BWJfZrxkrtD6A6i0HES7y8mtcELsMrkV
         8LNI5nrNVkDsMKlvFzepFCOAR91C0R9CyUAqLseGmp5kyR6usLjbo0LpAIeAgqmsaNfd
         ogyQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=S3qIk8u6;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=cUzYaaZxBPla3W3l3T6PCv1VC7W8MU7290x6HiByBzI=;
        b=ryeUtfxZ7dqPlDFTteQFKigeS+yNwCcvFa9JNpmDHXplXOsLLnjpc9FBetsg8FpMGc
         ILvpn7loBjnFO1k6R7IsXdfmndh8pqeGKlPFiVOUgD4XpwJ0RWYA0Y3AWGB7L7ErtrH8
         qSjO5ToZekhFDzfgLVCM9n8cGaj4wg1FDVhSnLAbXitTv/m2gpmQ8+rLh3coCb3p6ToE
         I0RskDR4n/mplBQgueun+X1HrD5FPWsXJRrMNeDma0qps81EX6u6246k1DNPOANIgmCQ
         FIF4P4E8ti+A82+0Ep7uPH9La7MfjKtdnQyJeNqkwow/fGpgNMYba9tGJPtT+xMxCgLj
         roPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cUzYaaZxBPla3W3l3T6PCv1VC7W8MU7290x6HiByBzI=;
        b=GCS7me+dtHB6nkCGG+mRl9nukms3cw4ziKiYY5EtwNGFARoO++hDKl69zhjFRKEex+
         0RgvZMdXS0t1LAvx/ttWCrTntfFVvYk+ltto0Tdt1kFAC8C/chuV59tRlq7Vc+/OlZyt
         d4b3YybgxLgFIxNT/LbhKMSdFUdc8u83y2VNxxyqd5Bvs51liXSkOQKKQWSVqMpdSNCw
         eMzODGUc6xAdUawU3wJWEn4OG4jqICKAEkIGvsqFdku3fPbAp7ZjeOwzU/mgFVCJL2R/
         hsEEMpbzBcCrtv8YqSPz51hGNdYbsJUgV1WI8ZGupHS/R6jyZDEf18yA9vDSsHgFJ8Kt
         lY7g==
X-Gm-Message-State: APjAAAXrDeNJKAC7f9HQ57UpjVvlwx9QL+6eSG9qAYLYj5WLp1kQtsZn
	qF7Vy7+/OOyPwT4A1N9Pkxc=
X-Google-Smtp-Source: APXvYqz78hOqv+wPXFD0CNfThOiczEAwt/upaxITnmjWrgsN4Zq16ots5EnbOaCzaq1d0sSnzcl/0g==
X-Received: by 2002:ac8:1e8a:: with SMTP id c10mr2898364qtm.45.1562337735100;
        Fri, 05 Jul 2019 07:42:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:4658:: with SMTP id f24ls416156qto.7.gmail; Fri, 05 Jul
 2019 07:42:14 -0700 (PDT)
X-Received: by 2002:aed:3461:: with SMTP id w88mr3051269qtd.13.1562337734828;
        Fri, 05 Jul 2019 07:42:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562337734; cv=none;
        d=google.com; s=arc-20160816;
        b=GPOFiLM8/18jgv6A4Y0VrHhAlVtV6dmvQfPLxpOnpv89OemhReFTl6jublCV4OqwnM
         IyJ70KPhXVAwQ8bW458ie/oif1HLiIYsChVCLlXSlnW7UDco6MUcsKoBFVnc3sJPEZnZ
         NA2jShzduibNPaM0PpiAZgOm+aQLooBxpwuhNKK1Mj6tbEvCZW1qbKj6qGwrgR7QxY7f
         Z4WEZmI+tLbVJxIQtLrwp1mK8umSGCtOCsDabPP4Y74TaARnm5wYDnP9hd0+tj4qp/fM
         aOZWVENtvOJlXkWrv5rkIkMkjWxtc7lKJGJwUx5YHTzkg3//QVojPvLjKi+T2YUlStoN
         sFYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=u1quH/doLiZcJOIFEvIvb1IeNSHrNbj3Yqrt+Y89JNM=;
        b=mQHd+ZP5TmpiENq8hoETExAFNlZ1cNOr891cHmmXfvjDWzmwwLGuw4UD4eazFV8oiN
         PlXhkksqUBBiDHnBzwojSH4N28/jMWODmmq/jFyKbOG0gn9j8O9hU7sQbW+0KX6y6jj1
         IVcaCg8Gw2WtGN0LLT8s3m7DXV5UGkKQ1dz1U2lF4SzBBIwESwh8M0AjZ4lu36Tw6Jik
         hkI1EJPaFbtkMBj0B4ruPSaL4IdQrBEHdP9vwdMdp+sm6mM2HnN29kIa5daTq2/QvhaG
         iyN27k8KP+Z9ReQ73dVe7NSNfHTOewFqMs0dyUmwHFyIx7C8vio/yCtI9igbthZpLNOR
         gimQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=S3qIk8u6;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id g41si519974qte.4.2019.07.05.07.42.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jul 2019 07:42:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x65EgESM051822;
	Fri, 5 Jul 2019 09:42:14 -0500
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x65EgE4L109810
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 5 Jul 2019 09:42:14 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 5 Jul
 2019 09:42:13 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 5 Jul 2019 09:42:13 -0500
Received: from pratyush-laptop.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x65Eg1o3067904;
	Fri, 5 Jul 2019 09:42:12 -0500
From: "'Pratyush Yadav' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William
 Mills <wmills@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
        Pratyush Yadav
	<p-yadav1@ti.com>
Subject: [PATCH v2 4/6] arm64: iommu: smmu-v3: Add support for smmu v3 configuration from config files
Date: Fri, 5 Jul 2019 20:12:23 +0530
Message-ID: <20190705144225.7126-5-p-yadav1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190705144225.7126-1-p-yadav1@ti.com>
References: <20190705144225.7126-1-p-yadav1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: p-yadav1@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=S3qIk8u6;       spf=pass
 (google.com: domain of p-yadav1@ti.com designates 198.47.19.142 as permitted
 sender) smtp.mailfrom=p-yadav1@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Pratyush Yadav <p-yadav1@ti.com>
Reply-To: Pratyush Yadav <p-yadav1@ti.com>
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

From: Lokesh Vutla <lokeshvutla@ti.com>

Add SMMU v3 type to jailhouse_iommu_type.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
---
v2:
- Drop the struct jailhouse_iommu_smmuv3 declaration because we are not
  using these right now.

 include/jailhouse/cell-config.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index a559720c..c638f2fe 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -202,6 +202,7 @@ struct jailhouse_pci_capability {
 enum jailhouse_iommu_type {
 	JAILHOUSE_IOMMU_AMD,
 	JAILHOUSE_IOMMU_INTEL,
+	JAILHOUSE_IOMMU_SMMUV3,
 };
 
 struct jailhouse_iommu {
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190705144225.7126-5-p-yadav1%40ti.com.
For more options, visit https://groups.google.com/d/optout.
