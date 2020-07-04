Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB5XRQL4AKGQED6SXZ2I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2B32147A4
	for <lists+jailhouse-dev@lfdr.de>; Sat,  4 Jul 2020 19:14:31 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id z12sf12830255ljm.4
        for <lists+jailhouse-dev@lfdr.de>; Sat, 04 Jul 2020 10:14:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593882871; cv=pass;
        d=google.com; s=arc-20160816;
        b=HicTjTrfpGFeVN4/BvHuPAXYnIdXMQd1/WdK/NoyyW1T7GWtW7FRf+18NxqsYcRH1l
         RRJXcPFx6QZf0koIojZoGVzpXYJiW1uKJzzVJFjY9SVGD1B32FhsD47l+9TCLXIaB2FQ
         rxZ1VYXgRiOZ+1cClxY5qiwdvbqxzlIq4IPRgliVlanQLBCnV9OJ7ZQn6MOIXn2IKiO7
         bd4VMTRxCSrSM3cNVoGBN/2ngtA5hlvEuWwx/pvkZvPdqbAtVhp2v89Kjvqt3hR28ztA
         wNpyt5iTV+qfsTepLrunQvat6wAcDzCMiaaLGeutDRL0aLeKCeDmiCxSnmbfEU+IQX6R
         RAuw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=7wwFlm0KKy8QKk9vkbNIvquiGTIernW4Z7O9A0rvwFg=;
        b=EqrQLSu8myUi8rawmUuE2d3/3NzdjrlBStYeJQn8dFKhafi04dtVYEOOSKjRKqgYMr
         yfvlC+G5gBaXZPtzK8LVEw9F5EdnId1ennDJIffWxIfNi3jBRId2mxzOY8lx7KkgpDru
         iySD3g1LSvhGlwUc7ln35lxyiGZmRWY/g56BNigc6qjT3j7tU2m8yzU/Zt+hG4eQ/+VY
         E5FgPm6MsOfqlzy31TezsCKzbBJuczzaKl2gatxVSRaT+FD+EhrdknANdA/pg4DzpmTY
         3S3yPPprSI4xtx3fc/YWRvcnZYH9s9MHZ9JpxpZ/ClmvDkDNF4plfHF6hyw6VvQXqWsp
         O5QA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="L3/Ep7d/";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7wwFlm0KKy8QKk9vkbNIvquiGTIernW4Z7O9A0rvwFg=;
        b=Gb5QAA0a3NIvK+wGWdelRo0HiDMlVTH+kOmukhTjCjJsmxWRR/tBlvcC4rWXFlAHpf
         s6YPxtHgraUmTIA4V0hvDjVIVdaiUeDzGKGdH0xK3ounc99m/atOIImmpZyejbyWxCA4
         mg1TTcMMINBlF9+Iz+bOfMmxZmhDmNI3epvuhCokjPLlL7j3yPCDWbaZf5EtLhVO645V
         A01bDGFugTvGzkYStl2xa0adm3gWlOWV8AhAkqC2dYhPryn53XyiqItLNNVYXdjwYDvf
         jNbyfQInD+sKbmxt7v/9Dv4xIQwxRsLvNOGD5TNYq6btYqdhM39yN/nUWMGD8rq0mULT
         fD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7wwFlm0KKy8QKk9vkbNIvquiGTIernW4Z7O9A0rvwFg=;
        b=PHTx+ynJAJzAufLBQhAtbiGsEjq9kR9AyIBTsCbW+08rM3zzl0DtOSwIcxRcOnOOMj
         0RELNIsejeXzMInrnsurANAdSRIxNPQXizJGqWiq+hbestslrv1U1sQSy/O3n/8FCw9J
         7MpChZMW1t7XdZpGm6z6k0V8j9adMkbSocTSMFKmFP4NupdluOa1VQoCql7+CmGQ/wrs
         44q7yywtaDy0lGoRVK6iVm9EuD/NnAwKTHZ0Ff8EOtPkdNHr6Gzl7KE/QATKqyPMYgrf
         SsWkGPEKjAqjuOOuYqdfVCEUjxe7ZD+h4eFIQW/Ru+QtkenHGthmnaB+YgThmBM8nAP5
         smRw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530LkizOSIi0/bJlfZSb8zT428blT9zo9UnL+mtEkTALZOJau4mL
	Uke7y3+ZeWKu0kRIg81R+hw=
X-Google-Smtp-Source: ABdhPJwxjnl/i5CC9/nO2HC1T8PnX+E2WNoo/8gUWXfvMa/udbghhbL2BxcUI2dBcThjH650x6oRFw==
X-Received: by 2002:a19:c194:: with SMTP id r142mr24695230lff.87.1593882871224;
        Sat, 04 Jul 2020 10:14:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9b09:: with SMTP id u9ls476288lji.3.gmail; Sat, 04 Jul
 2020 10:14:30 -0700 (PDT)
X-Received: by 2002:a2e:9bc3:: with SMTP id w3mr14603355ljj.121.1593882870044;
        Sat, 04 Jul 2020 10:14:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593882870; cv=none;
        d=google.com; s=arc-20160816;
        b=s09+COeLhQUAVYDJdh01KVW/+AjU+F/GUrA9XUrQU3LVvQ0rpUnLqqX+xisFPgfQHS
         qwQtnHdUHEbmsiMrS3yeyFWPY8nioT0O4ZIzXC1cQy+evbeXBneHejgs7bs/iy+9Z0MC
         s0cHLkUPKuGbTlkc96D1i79UY7pCCnTbnyKcO5CAXtZmSqjeILeogjwzbykDOMaoVT9Q
         xDBm966Q6n39qmfvqtmjuB5QS9xbMs+77awp1/7iL76GSWXaD3OPA+VsGntujUJ5QFzK
         yOhO6Ek5Y0DHA16oWYuwGDtZOlXrtVp0OW/iXhVspV5cEb0OIyVFULA5mbF8wmo69DzF
         2AEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from:dkim-signature;
        bh=MCqTUVzMMR/ZHTyPPD/dH00fB9o+DKVk2JhrIR6z0TQ=;
        b=u+DH0uQR+jtTVNnREav71yyk4/nzu44KvuvkEESmCTzIoMaseOH3ngtCVHzpM/8u68
         O6uknX/Zb2A0xli0FMuxk2782uMRtSk3DVL59IUFvO6cFs1eSnINs9DDD4W8HgkaEr7a
         /47hC1UYs7GONN/DFyf1LvICgg5zWz/C6cKid0KJgGW5l96yCq3YShQGzJ1TvOL8A/NP
         XWx/2P5/n3zfPAGI6qXt/pspuTxBTwzsVmKd+rqLtqqx5DlZPliquoNFf7fNKnTL5RBG
         cBBJzMhcbJwnrvUxQyoiI0pVGft56EHi7xvAZwCuWeuJk9eIoqdYI4DoP3nGScyrJFT3
         tmVA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="L3/Ep7d/";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id m21si576880lji.6.2020.07.04.10.14.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2020 10:14:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.11.10] ([95.157.53.180]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LmcRH-1kRenG12xv-00aB4i for
 <jailhouse-dev@googlegroups.com>; Sat, 04 Jul 2020 19:14:29 +0200
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] tools: ivshmem-demo: Fix convert indention to tabs
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <93cfb85a-82db-2d5e-c237-4f4fb4c547da@web.de>
Date: Sat, 4 Jul 2020 19:14:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:qrHo5dLLjYomhN7ZWLcRGNZ+X8nvUsKLNeg1LYVq8XaEvzGnmvY
 SKd1bMAwwEUkgqF32VzeiHkITY0E78Wpm1lqipbo0ckFZ238UNjClCWVPJ2S3JyPZ56pFJi
 yvBhBLq35PqQytVxe/hex1038lmv8Klq5fDDbk3TSdMbOJrbV8hd+Ugw0wRXPrc4YNYLGvy
 EWGSvTTWXeXyITSyEppAQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MDbnrQZdV/Y=:/gs0rfCqUhb6QkUZ+o43VQ
 eX1PM9MDUIyZE7aLj0kQe5UAVB1A+pXIOZDt6UG4bkBQ68WmxG2PvzP4JG0PZIv1hzeyDVKZ8
 Ge/ydLkE5kbq838fKEie8S9slV71sedMq+0QbvvV8vdEp39DqZzXazN/Ddi+jJSKEbETB6/SA
 YzcmADNrptjAIx/YUtDxsOIzxCNJcD96N30cbHNx+cI+TsGS7BqJ0urZscL3YMlAzJ4AFYP4G
 8uREEPmoYTv0ghbNa2O18GfkI/P3zIkRtrT+HizyPMW6fqAR+cmL5o3ZigDZ71UPzOAg1L+Vz
 iW0u+4gtWwdtVH6PPuDpYoH1sIpaH53SdNw2OrUGe6PyUuJ2jMIyZ1uHlIQSt1n/8cGzV+RoL
 0vtDq0weE+4Um/aghRe8FfFeTD5W0U3iPrs8CLToz2QYQW64OdmsG36TVVtu0BOHv71KuPOOY
 KLYbDlY89cb/Ri5JWKDP+RssbWofU8jzk2q57ghlskNWj5JJxIZMnZNTvWoDx2enVJ3ghiPFh
 jQ1dat/M3PZpDIckjKApTXQVXColpW7FHt31wWF4hmP+je3+cSPWb3NrNvHECdf07gjiHGSkK
 OtTKxmLbEkvGJhyd8U52TwY2GlS28yOhFdlpsrLAjjf/9zEaERgcbLUB9Iu/YYe59QHqb7NC4
 1WvMzaJJrnVYGqNBAid2T6ceQ+x63ZztP/f45lLN/nYZ1x0h5yD20rlzTdc/glV5ZBh13EdO3
 Ggg1a9vvaXgI5X/4M4pX3GV1uSfxFp3pw2RwbrFJcD91bI+PvNgKS7UbpEGL53mr8WX3UJDd7
 5rqENs9yMlHCYUNMt4gUvFA7/TcaCCTCQ6AwhXpd1pIz1L41qn9PmZ6DgbqhQwU7rVouVK2+X
 dBWMQHUIqBVD/dWESkyoFjJNPHGOQaycPBFOCZQdrzKI3wyHByDUPhjff8JxjbV45+CaVKvXN
 +EGxk6mI4xaL4rh18NMFza5uVNAwhQ1zkmWGvcyp2eUlD/F2uBW4l5y6sQuJQGplzNtKjcPPA
 2GdAcrg8i2rKmFYlAZV2xmpCzZKXSNvs+BkTCqXSg+L5YQQaumil0lyMhix1qlHjng9uFy+HE
 XRVYsxxJmDS9/LEbE9Yxyou7X/yRDtCO1Vs8NuSDpuITI0IUC+vru7hfiVfeTZfL6u4qzbw7x
 0yJluviQk4zHedBXgjGOHRJFEl2bxVadrq8kEALWUOPo5wLGJLaCTEId0R8lXXYfIVfK6II6U
 6D+efqmZ5T/eZnK/JT6n5ubPFFLhqssWJqXCLjQ==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="L3/Ep7d/";       spf=pass
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

No functional changes.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 tools/ivshmem-demo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/ivshmem-demo.c b/tools/ivshmem-demo.c
index eb4721f3..318ce8e2 100644
--- a/tools/ivshmem-demo.c
+++ b/tools/ivshmem-demo.c
@@ -37,12 +37,12 @@ static volatile uint32_t *state, *rw, *in, *out;

 static inline uint32_t mmio_read32(void *address)
 {
-        return *(volatile uint32_t *)address;
+	return *(volatile uint32_t *)address;
 }

 static inline void mmio_write32(void *address, uint32_t value)
 {
-        *(volatile uint32_t *)address = value;
+	*(volatile uint32_t *)address = value;
 }

 static int uio_read_mem_size(char *devpath, int idx)
--
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/93cfb85a-82db-2d5e-c237-4f4fb4c547da%40web.de.
