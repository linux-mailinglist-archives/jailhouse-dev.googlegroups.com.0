Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBGUXYH6AKGQENUAHRCQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x638.google.com (mail-ej1-x638.google.com [IPv6:2a00:1450:4864:20::638])
	by mail.lfdr.de (Postfix) with ESMTPS id D113E294F20
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 16:54:18 +0200 (CEST)
Received: by mail-ej1-x638.google.com with SMTP id i21sf1897728ejb.5
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 07:54:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603292058; cv=pass;
        d=google.com; s=arc-20160816;
        b=xMer5C5hFjEt6dkR1O86wUPeWNSOSGh5LRbPlYsxxcCQSP8tNuYA8pZffSQV3fpx6P
         u61NWgZ7qPWoezL02GbXd+G1MtlvgouR6Vkq9BKeKeicZ0orPmNmQRF5Gmtnckd8vIp7
         WLMimptL363336hQOQLjhAe25zAsUACM2/kxNFok+CBt8xn7Oct1xbVMWPiVTlYdshuY
         mwEI1dJNj1CWtZqMDTRffxCYCR5xM1lVmWNZbX4cswvOHUAO/Bs6ibycSwqZMH7G0370
         qp5z7oxlY/QWEq+NptL0Ln98rewVNetQP3wziDGP2gDyfsqwpLj+2VFJnmxgLxRyc4Y8
         m3nA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=X+UOOXBND82aYNGhBIOxOAq7I7MFu1AWIE0CdI1OjZk=;
        b=rqyi/FsfW7pO1p5EmU1JDtZ3aS5WpBgVsty0kS1JuVxH6yxW1YEIJf0EqcYCyqDE+m
         zuDkN4egGVzyvcE7yjd4eZQ5QIQ3u3dX6/i0R12q1HSCEzvDxiY2+rNsxW4IIK9uW/VI
         nqJMz24m8kzwoEdOQIoNVcn9ptFVDao1XilICTEozbpwCM11IR221qH5jN8LzGzp72sq
         DUIzexb+/iNMzRf8vsKtpu0l/8KhfK+2rUhNkc+623nFKquyVfamagmh+MHrC9mIwFbO
         JLVqLskIE1NMaFjNe4BVm5IdZ8LVP4/rBrtL1kZlGzB/KY0oOhXN1qkh1soOQHzTqRCI
         42bQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=VfQPrkA2;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=X+UOOXBND82aYNGhBIOxOAq7I7MFu1AWIE0CdI1OjZk=;
        b=Q/XJA6yCFrIeR4fHRJekOwKIhPQlDQs7r7r6xQgoGqLrxDHDJp8QGPj8ZF997UPJ2k
         gnmHWmSZdYBI6rswXxmUW4S4RXoWDzcDYkPlhDPC7Yu/IJP0CHVh7jSfNIc4ha9CY8bm
         mHIAaNpDjgmvPnvSpMSdlAZ/Tf0ywGZvo5Jllsu3ZKd+w9iMB4ktwncKFBzRJHxNyIhD
         hyjbKvyFY3Kf3lxNBBG/azuQBHHdr/zOOUR2trHI9dE7r4BIhqZpNbmSsolluMteaz1D
         vOYNdmwujjQ3EmSo3cuipX9d8sxeAcz8KTimKBUofi7MoYwYkkLvlVHwZ36w4OrxGBrP
         m9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=X+UOOXBND82aYNGhBIOxOAq7I7MFu1AWIE0CdI1OjZk=;
        b=tuRhjRB1hG8QYnj4WhfSLcg5aZtTGKE1OYyNJjImVYUIaIs3OicNYPWzBnws3zFheY
         62713k5rwKpKzv+zVJ569MBxXuCRh0N81Co9Ja7r/Uc2Z5iHPqNc242psocEGscO8FLk
         sW6a3UmrbJDg91rMVsX0plHlBSzStepaDGkPijTdAaL1edww/rNLwdYHtoMfEPIjuVzq
         Lo1KU9GXdRPLcYrkuJSD4dcPzuQs5TKCMhmnLRVVaTkxOUJn+pvhqPOTjb5ejFgoaPyf
         yh5PTemNEy72ypUSSgal32SJMcdyrO18Zrv5wQoC/a2UGW3K9VmNHcPadxtMWjzQggqQ
         wzPQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532FcLUEsaYyPhIVs/3qNHmOr6dudADNhIKrx4vxP67wNBAwZABh
	nKQ64zwDyt2zy1EB5nLgXA8=
X-Google-Smtp-Source: ABdhPJwz2IhP/4BAKNjULH8WvBaTK6SL1dKLmHOpdsNO19M6xI4aC+AluVqyI0LUpu2g/8VUNw8P2g==
X-Received: by 2002:a17:906:80c9:: with SMTP id a9mr4048839ejx.235.1603292058562;
        Wed, 21 Oct 2020 07:54:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:1d3c:: with SMTP id dh28ls5429748edb.0.gmail; Wed,
 21 Oct 2020 07:54:17 -0700 (PDT)
X-Received: by 2002:a05:6402:1388:: with SMTP id b8mr3527844edv.1.1603292057361;
        Wed, 21 Oct 2020 07:54:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603292057; cv=none;
        d=google.com; s=arc-20160816;
        b=s++iCj6rizjCT8ZdDyOhhg+hnw3URWsJr1W7tqKZWoz69Tw5rINzw5/F9InSLYu6/8
         YmqZ/wQXDfgc4AhkwkLQkHoRnTIgUPrKErH4KShl/CTeBIGPVckroK4EcMLjRE3MJ2x+
         yo1qbEN2ahweu7lyAZCV+13iwgSneK4n5GiWw7HBol6qwl7ohto34/0Fr2N1FFy1C8j+
         X3DToK91w3qVg2wHuWvv05bF6J20kZ2XcAwoHNlw2j+rPO/gHiZ0ctxt+j3siK9QdgE2
         OGofXLu6bTZI/2Be/B712AaPfN3C7CeMFGOnhy0xGSTjvrk1tW78Olh8hP8n1WXLcGn5
         q14A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=QQsK+QtbSi9TXxEmeYkLq0uBbtCOmplg1asivICkcYA=;
        b=tPQ0BuGbcfPpx1lUX7FiDlJTFQ4o0Ueje5zMggRXILd8kdtyRxsn6g/oANwpYqTyoY
         JNK+p4Cgb+LP7RC9WPMFf8e5MaQO35R2fuwj7e4qQMTwM0K818LndAdVqWtzcqu4mVax
         ZC7Lhf0dgWJYWnsVy6XXfdN2CqMnmoxCG2dUU4osEii2m9sj3GYSx1SyliMk6s24KiOM
         1Pswdv0F5z4Y548AZ8BQ7GQXUlbHxsN9z+mHO6vSOkCuBqFEc8nDEUZjVq/JyFq2KjBS
         ci75aUPc1wi+y4Q5NvBad3+T46p7qcyD5XOadPDXtYnYVaI9r9LLEM/BObnkOa7bx+vZ
         5T/w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=VfQPrkA2;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id lf25si110301ejb.0.2020.10.21.07.54.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Oct 2020 07:54:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CGYRY0gNMzyWr
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:17 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.877
X-Spam-Level: 
X-Spam-Status: No, score=-2.877 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_TO_SHORT=0.001] autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id w55-3l8ulnyc for <jailhouse-dev@googlegroups.com>;
	Wed, 21 Oct 2020 16:54:16 +0200 (CEST)
Received: from kabal.tum.de (unknown [IPv6:2001:4ca0:2fff:11::2aa])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CGYRX4dHMzyRN
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:16 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 12/26] arm64: ti-pvu: fix Wsign-compare by casting size to u64.
Date: Wed, 21 Oct 2020 16:53:50 +0200
Message-Id: <20201021145404.100463-13-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021145404.100463-1-andrea.bastoni@tum.de>
References: <20201021145404.100463-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=VfQPrkA2;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a
 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

No information lost in the cast, size is > 0 there and fits u64.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/arm64/ti-pvu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hypervisor/arch/arm64/ti-pvu.c b/hypervisor/arch/arm64/ti-pvu.c
index 3b9a29ec..50104212 100644
--- a/hypervisor/arch/arm64/ti-pvu.c
+++ b/hypervisor/arch/arm64/ti-pvu.c
@@ -286,7 +286,7 @@ static int pvu_entrylist_create(u64 ipa, u64 pa, u64 map_size, u64 flags,
 
 			if (is_aligned(vaddr, page_size) &&
 			    is_aligned(paddr, page_size) &&
-			    size >= page_size) {
+			    (u64)size >= page_size) {
 
 				entlist[count].virt_addr = vaddr;
 				entlist[count].phys_addr = paddr;
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201021145404.100463-13-andrea.bastoni%40tum.de.
