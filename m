Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBJ54476AKGQE42LVW4Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 3552C29D246
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 22:10:00 +0100 (CET)
Received: by mail-lj1-x239.google.com with SMTP id h14sf299162ljj.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 14:10:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603919399; cv=pass;
        d=google.com; s=arc-20160816;
        b=vv1j5brePmDajjk+G69kujvi+uOutImHPo5n+7QEKq7/qXq6hbhCkynBVpgcS/biRX
         +NwY8W2I5IaZZtGSpsDVHrEBu0BzRX79/QCOoVcq1wYcgrSwC22vZSJfPxy1IewowwIK
         VYYE6GaFHhJxoq8KumAvcDhz1rZc7oFT8mgZd7ODNezqHeSfhloFgS2V8W5O6W1glwh0
         WvEMuHdvl64pLYYfcNo/yqfTXfV36H2bPor/UKZJlQw7BZwVrMMzfq4UFFfmH0tZy8U7
         x7umKrmNqh0s79TOhqJt4L5+lVloWkn6sadTvyqA88acjEXDzvxfEWUq3dhZgYOI5cnM
         bKkw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=SihdnQzt5d67225EhmrDs0PF3mRVdFvvVgG9QhPd6DU=;
        b=BAPzyjH1jqAbngyXmriJdqHeK+kkivYUuSJ0D52nVBXRY8Mit0I+JY7ZRkN3MnuETh
         uu5OaCudt/KM0MxAZBmETIw3LY4FcmzV98PRb9QNjCrMxlXxlOS+XFPF8dAmB34EthKO
         nHzAHtCmB48XQDzp9DXZNvIjj7l32ePgiuUHb2aqSEnn4KvHsh7QsbhTOU9lwrYpQTJW
         E6ZaAEqwKExaO/o0cftq5Xn11AU7uxVMFSrSJPz31fYZd8Jbj6ocALkqamgT7gttOly/
         jVblTzQ7KLj+2BiWGm+4/+9SGHHbIGOabQPYGgj7f2qxjCwEQN+8d63z8mt+AKUAl6Z+
         EJ0g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=Ln2m7ASK;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SihdnQzt5d67225EhmrDs0PF3mRVdFvvVgG9QhPd6DU=;
        b=L0375RM3v+wLPwIo+NE4BLRD1msTWDWdKnU8Z3/Ku+I4FkKzcTTBtRI5c/7EvXQooA
         dsuJX52fCTknS75G0v5Ir+e44appk8hj14qPF/mNWBI6SXDGbnh1jxQitHkW0v6LM1qF
         SqzMZzoznX+ag4bPQ+SmlvHLxwtP+0iLu9eI7ld4anIaRpsj8INyVdB1Y2ODaWtORIYj
         KlIdQevf7fF+wqh/twGGwwrkIM1/moFrG0scM9qBURFvo3B/+lSyBcp9I9Y4mgGF6U/G
         WbqqSbYpkcygTM0ji2QbLVhbWoQVQKVhyxFyXZuxzjri5IZDPkGU55J1+C4QRb66BC6P
         GZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SihdnQzt5d67225EhmrDs0PF3mRVdFvvVgG9QhPd6DU=;
        b=BMPio/Dv1SGkIrDgrqTxjGw21beEmsgaQqVzorS5tEBW38VHSzEQThtjUN0Zq6t/Mi
         0NxueJvP7RZeN8pEBzQptP7p/6mx/TqU7hIgeZG4UdahKWLdyOmUKn/OUpiY74hKux3V
         lUo4I9T5tRAoPiCKOpuh3kP6eufN7yE50SkJy9sxw91D+eV+pF+pM3PRIg19YLOIlsyt
         wAgQxMFiqVB5wo3eT4FuiN+BvANdBaXJI+zpYPapCIN4M859Ys/P2eidIwjCuRFA5cNh
         B9Pls+P99oaiYDeBRuaD/9ewPey/LH06I4LvlCMmi352tlXgVqtmv/pVD70fMKjc3fPq
         gdyA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531ye5centf9dl59N5ltoMnzUm2lTUj/oYOLKuWtYiIW52pbCkTn
	pvSH7AopMv6MeNX1Gd6yDN8=
X-Google-Smtp-Source: ABdhPJy+qiZbFHgCtoM0eP9FkG7UKFW05jtpocrM86lWswbKrNSNXP7UGRvmx7/DsQSCCWhfjank5Q==
X-Received: by 2002:a19:504b:: with SMTP id z11mr373578lfj.182.1603919399764;
        Wed, 28 Oct 2020 14:09:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:7a0e:: with SMTP id v14ls133480ljc.7.gmail; Wed, 28 Oct
 2020 14:09:58 -0700 (PDT)
X-Received: by 2002:a05:651c:105b:: with SMTP id x27mr450425ljm.302.1603919398721;
        Wed, 28 Oct 2020 14:09:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603919398; cv=none;
        d=google.com; s=arc-20160816;
        b=HgFokP4IE4aDlNgruF38AG2ZhSe+DOQsIw+u00EDJwLFp05jQRjJlO9zdypUddyCUL
         hau+FGc6BVhuHV0NwvloOHtXLJie+blMRN99JpK8HgUWTV+Xz1/6Y8UDhQo37Ms5PnLa
         WdnHabGzgXSF7pUzzlOZgLeVOIAw6Qn2KM7vfFiuxfcyTlrn8er5tiSMr+Znj+eI1jqb
         biAgeN1SeBRXr6PGfOmMOoT0g7bBNdjpMV3hsoaThq2YcMgpY2QuiCj2VeAD/s9N1nHC
         pE1fzn/O3HOJ7cwWOnICeJRNhp6+PGC0ZobJn9bY7CkZ6fOJOkNZpZ/ny6aSKRJlIrXC
         WjDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=QQsK+QtbSi9TXxEmeYkLq0uBbtCOmplg1asivICkcYA=;
        b=bg41QR830C5MtcpOfHEawo+gMP2UPHXvHJsOGbEi7WKbgukyJTUDrqYS8ps+2maGRw
         RvryOC3nV2DpL313RrNSTntGLpX0e8imjtvN6khq3oTQiJJHTrrIqfHwDyhrWnJi4vrz
         vmjOP3ePnfh+/tVHA+w0gWof/fV5nknl+ttEpFDW9LSS4s0aUEDrWbkgFEF1cM4GzkTR
         u9oemnanz1gg2qJfYfnE+oNDbZjsNhIukJMgzz79r/xSIe0ytbwAmyo+BQ39HcO2s7hM
         GXzEI4y+6WCIXnU/083OSaJfGCwIKarOAj5FBg3ppIFo8OFQyHVEQ+0lP1IkXFxT8zUv
         HWzA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=Ln2m7ASK;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [129.187.255.137])
        by gmr-mx.google.com with ESMTPS id 8si22714lfm.7.2020.10.28.14.09.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Oct 2020 14:09:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) client-ip=129.187.255.137;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4CM1Rp1jBhzyTC
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:09:58 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
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
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id Gj3fH-rTttXh for <jailhouse-dev@googlegroups.com>;
	Wed, 28 Oct 2020 22:09:58 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4CM1Rn62DnzySy
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:09:57 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v3 14/22] arm64: ti-pvu: fix Wsign-compare by casting size to u64.
Date: Wed, 28 Oct 2020 22:09:25 +0100
Message-Id: <20201028210933.138379-15-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201028210933.138379-1-andrea.bastoni@tum.de>
References: <20201028210933.138379-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=Ln2m7ASK;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201028210933.138379-15-andrea.bastoni%40tum.de.
