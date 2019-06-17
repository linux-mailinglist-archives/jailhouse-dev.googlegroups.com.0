Return-Path: <jailhouse-dev+bncBCCMB6PY3AEBBTWGT3UAKGQEHSACV4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x340.google.com (mail-ot1-x340.google.com [IPv6:2607:f8b0:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id A769F4854B
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 16:27:27 +0200 (CEST)
Received: by mail-ot1-x340.google.com with SMTP id n19sf4945289ota.14
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 07:27:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560781646; cv=pass;
        d=google.com; s=arc-20160816;
        b=F3fOhvinTxyCC2K9MJjFSM6FJw4IUafGWBZEBCivDZ9iiuSrBrIcNWtdypaoUf/whJ
         wTfPZK2rxLDM70WWHLKk1RqnhQl0x5PcOhGPhUyIRsN339hL1Lz7JWsniFc3+rW1CSmO
         kIdsIbkFaHVe4nimQ/uRtpiUdp8pxP9CvbhjZvkR5TLVfzOHuHu9GTs2DuDL2HQKxJHp
         Y1v+Yabd+2nfWgYt9bKGVcOzwAEBmpauYI9Dejo7NNUffsctkk7FA+0e3s6SgYiduEBd
         QMDXjKoXGlmsM3u15uAukX9apr+ewS7RoMCePInaO1TzBYlzXDHbOJhF10oqB4TNfGUw
         nPDQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :content-language:mime-version:user-agent:date:message-id:subject
         :from:to:dkim-signature;
        bh=yK58BfjgbmUQV0yMbcH+w/93Bw+mrpnCNbyPQU/Z+ek=;
        b=a1D/m+koBTRtHAHX+rwJFaTJEKTcrhHaEWg1siHrWnH9+oMHPgQbpkico4mmWPEmSl
         4QzX46/8twLr24+0nH8FymqAw2wYPKGXU9neKICpArpoPBDrzqgyhEN79O6V1VUqYzCZ
         n779u8IZX2SuDnJnCl/cl8Vz4ZHWrmRbdRSYsVG1rRr+xIh2iSqN7Z6U9jgYxXmBSanE
         an2Sb/6xn1fX6mA8dXKbd8jzeu3HNNYLjuG/1ZI7FSEI5SricFzJGoqaj9JEMEKdj8+Y
         BJTa05BkZe5/604Gem3kh6weyNUK9a92YbvsK2f3UWsFnrXlwjtztORqD+JXkpmdDNDN
         G87A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=n6+SSyiG;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=yK58BfjgbmUQV0yMbcH+w/93Bw+mrpnCNbyPQU/Z+ek=;
        b=Tf47zbSbHcGXoyrFe/Yay3DFZIYGulrNEU/JvoKoK+gJ1LzxFwBaEkOYn/2tcA6zkq
         +qRUbB+lFMKndUmZbZQk7VJBalCox0+yybEhhjMYoREYpfukVbYvQFr4fAYdJnwrS80O
         67zGAG6398VDZGWvJ8TlptGJBQUzbHJebfuzL7FyYhBfAIfm6/I1vMfiyUOcg/0fYaU/
         U3RRw9sds7b5bnFiUxsyJ2S0jaYjzejh3ORNJd6f0NNsCFRIZJTDH7sxS2yMe/6TygCl
         NhmoM8O0/fY5PNUbiSFOHr0W/2k9Xw9YVBjJtiNyLtf6BQXmSXQO4Jx95jdT8/eV43rl
         tuUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=yK58BfjgbmUQV0yMbcH+w/93Bw+mrpnCNbyPQU/Z+ek=;
        b=uWQ06OawDxUZLw3XMJszrZd6TCk8d/cnNtey3u4VMUiKJk0QCArYRhtuQARVs2RkS0
         4Ic/XZK9agVK51+JkpyIUt3gf7IJP/YPpaMkg9Zgm0zHCGNyXC3b8mN3MJ3OYj4TWMA4
         Utiundn2XvoIrTlZjDll7li+WNnW7DWMiGBavFuVxawwwk62T8S4/JK7GZ/S3g+7FwsI
         ooMLyFWsfyHsAdoQnfAnXnLKmsNy9zUJ7/xUyydkCHgPKX0Kag1WiSCg7u7XOC8hZSy/
         I6ieEpA1hNH2o9hQxq1iyvdQntxUveOXi5ir/639v6n6we+gxyY1PLlNHfTVk+6izAkJ
         TZ6w==
X-Gm-Message-State: APjAAAUEWVwoenbFmlto0fFLCfzaHJLB2pm0rKWFCj/FS+QY0I+fekcl
	ya6/xhTyaw4x2tfCaHIyPBo=
X-Google-Smtp-Source: APXvYqzTGeH+/sJFlK9raHiBqcCUy8bgfFTRgJ+xrqmi2t2QMLPv13rMGf+rPSwOXpfYaUsAPounWg==
X-Received: by 2002:a9d:61d8:: with SMTP id h24mr21023419otk.53.1560781646646;
        Mon, 17 Jun 2019 07:27:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:bec4:: with SMTP id o187ls2338062oif.13.gmail; Mon, 17
 Jun 2019 07:27:26 -0700 (PDT)
X-Received: by 2002:aca:3a0a:: with SMTP id h10mr10867160oia.52.1560781646171;
        Mon, 17 Jun 2019 07:27:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560781646; cv=none;
        d=google.com; s=arc-20160816;
        b=npjtnsRIEzrQpn3VKs6T8Xt3qLRU4xc9KfTcGeHIMf5s+5qJfk87b+4+bF1pjQcvm7
         DjyApi5WYz2s+HU4EPb5AONcqZXIS679+K5XopGYz0Gk/gfDNKngPIHqfpkgLAP4JORJ
         dRvGG2v2On2uJuU+Q0EWj9J9Ki/ECJMnY9PGXNw9I/MDas/HHJs7FvYow7x2o0DlpoDj
         WjNG9sd8igOdwJkmGf7qqdQoziIHZo/t74tiglRhn7uF4VP0ZSXNsB7Xs3RIhKjwZG/T
         P0jWx8qjJqSGPfU3vqms8kqigh+mDq7KILijGQ+LmAiZihaqjJS54EKtLJQjejNXH/qS
         CFgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:to:dkim-signature;
        bh=Amdz3KUtFDEKmatEqA87v75fBNLV68/WqJsaODOekVY=;
        b=S1qLqPMvcfO8nADSS5M8BZfwKUdt7wgOhrMAEa9n5DADXML0xtgtVuZ9J8xgeJaxDP
         xQbV4UTBsmSWDnKk6bqhjxSkAIk361d5m0rWrZczjjhzTztcBEBj5gUey6n1WP/+R2Vg
         t7lmpkmp4eX4I9YNOfPoD1xwjvxS3xxA0mM9WcZhgqlLW2DhzfN5UCir68KeGu/9pqOK
         WXd+3zvt1tQsvQntl0crEYjQMyuovTQQq6qSDMZncMJBIqHf6ZbhvYOjK7D7EM64jmpZ
         B6UQt8Mj5CbRtqJgiUAsCS3q9rwjxNu0wdUy20t/4kXv3BlY5PevB26rVASkSmLYTLWz
         RABg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=n6+SSyiG;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id n27si269490otj.1.2019.06.17.07.27.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 07:27:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5HERPcr023094
	for <jailhouse-dev@googlegroups.com>; Mon, 17 Jun 2019 09:27:25 -0500
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5HEROjH067733
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <jailhouse-dev@googlegroups.com>; Mon, 17 Jun 2019 09:27:24 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 17
 Jun 2019 09:27:24 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 17 Jun 2019 09:27:24 -0500
Received: from [172.24.217.248] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5HERMpI004656
	for <jailhouse-dev@googlegroups.com>; Mon, 17 Jun 2019 09:27:23 -0500
To: <jailhouse-dev@googlegroups.com>
From: "'Pratyush Yadav' via Jailhouse" <jailhouse-dev@googlegroups.com>
Subject: Allocating coherent memory
Message-ID: <7b93d482-cce6-ffd4-291e-7e372f61cd89@ti.com>
Date: Mon, 17 Jun 2019 19:57:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: p-yadav1@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=n6+SSyiG;       spf=pass
 (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted
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

Hi,

I am writing a driver for a device that accesses some in-memory data struct=
ures. Right now I'm using page_alloc(&mem_pool, ...) to allocate those stru=
ctures, but I suspect this memory is cacheable, and thus updates to the in-=
memory structures won't necessarily be visible to the device.

There is enum paging_coherent in hypervisor/include/jailhouse/paging.h that=
 is passed as an argument to paging_create() that does exactly what I want.=
 But there doesn't seem to be any API/memory pool that allocates memory usi=
ng this flag.

I tried allocating memory from the remap pool, and then remapped that memor=
y to the same address but with PAGING_COHERENT instead. But that causes an =
exception as soon as anything tries to access the memory.

What is the recommended way to allocate coherent memory?

--=20
Regards,
Pratyush Yadav

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/7b93d482-cce6-ffd4-291e-7e372f61cd89%40ti.com.
For more options, visit https://groups.google.com/d/optout.
