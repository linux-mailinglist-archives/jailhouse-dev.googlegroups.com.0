Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBMFXVX5AKGQEVXPBFYQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 130E7256CB1
	for <lists+jailhouse-dev@lfdr.de>; Sun, 30 Aug 2020 09:56:33 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id k11sf1791960wrw.16
        for <lists+jailhouse-dev@lfdr.de>; Sun, 30 Aug 2020 00:56:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598774192; cv=pass;
        d=google.com; s=arc-20160816;
        b=lP6WDRSb8RKS1KD/up/JdXEedleZno1xH5N1fglAzKaKHmPJY/6gzFldp9EOPJqC4w
         VRT+jWsA213O4YManUkiCVFyL6yFEnwHSkkHYSah477zhSIWtc0TLl0GbrEdu68o0y86
         NmJxcRetZ21z4Vm2PTycRzhRsjNjpw1wV9bbO3Rm54bcVkFCa0wGnh3sd9ww3jgNox7G
         wBbOYwJJ31THfBs5eYyplv6zV0uCrBaJuu69GrR1di031XJUcQgq8czi74iKibXOdeXo
         8oNNBP2M37NMgDMkkuUxZ+pnOREuxyH0REf/WUkBTVnaTviHdYTibqIRkpKUUVaHyyRl
         J/kQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :cc:to:subject:sender:dkim-signature;
        bh=7OF3CJPQj12DExa1M9h4blzwjTdUkyA/UiSWsU8ol4Y=;
        b=Be19Jn/EEKhQlpH7xE+e2HXHeDEShD3R+P2yHni5ptxSOGhcKA7fJ+T9tGIcWhWju4
         RFMAyKzMNqLGkE397gKvCguqsRTwAsQ+fUY+hMhaXZb2WIxohoiXlVNkt6ecHKvyNO9r
         +BHJZ9zOqAsJwBsDD3J76hNrcA+x4K2iId2JEwjQViPwOVwPHPsa2YB+CaB6CvaTDYX9
         knMnlMe7/2DXwDYQyiwj7pyISNgW37Wz9sEiOCdw1a6fNVagL1F87AKuKZ+5Fdx2w52y
         enGcrTXnYbmeEzQ7yutHdYJJJmrHeLAoWQF8XQVW974KaiplIiKMvX/i982JXRujz5Zd
         W4Vw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="eHR/6HBE";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7OF3CJPQj12DExa1M9h4blzwjTdUkyA/UiSWsU8ol4Y=;
        b=mwNhfQErBcVIBDru5wJzyCrAadRBDwd5lLpg5JgBOchlFMA34e8BJTU20t8Sia2cSC
         2+kc/Wo9yhLNO9umBRMdE1UH5MUKTaVyyBDZxr1pl5gtHOIB1UzqE80hyv2MsmuLBVcK
         htBiH5E0fM4liIUGYldYnB21QUV2KYr9Eum0MYHU0XpE1Ou3TLUSWHxkDEG8F7jGv6bj
         IRBQx9FqcJf8yObDm6XNQUBTQ5LBjRgPL6BJA/6YM93SP/OjhHBZSeLAO6uGJf+5nEFf
         nGcq6+IYIh46p5vSEGlQmwPdMcq+2DZrRSYJOzKTS7v7pkVGjiNItBxc5o+ASEW7zEyF
         /X6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7OF3CJPQj12DExa1M9h4blzwjTdUkyA/UiSWsU8ol4Y=;
        b=sWXKggs0p0QnJ8s338sTeixRq9WCqX9MaO9p6rmrnnPu77pZVCncAGMkohOqo57+fk
         pLYcRqXnJ7Y1dFhn0s9KYTWA/aiWRWJGOcnFwYFBQr/jEx8OFtSq0GARo/JVzdrxVsmf
         aQ4cZv5XoWsIuHdvMKihMUcLy13OgKCOxVokV1xbjJWlrvnNRt/2K/1by8qRu3yj1OdX
         sjDNESe27BqPLJ9G8CHTtagjikaCcuSmWJ7Xd4mojYG2skYfRnUgBcgYOhvH7KS/hnpb
         OEnjqNcXeoJtbvjRJBhKeDpd3EHWnVnWGY7uIja5KgUTluCXvRCIS9VgvvU/5JHX4lmA
         b15A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531EjQnKBq0gEzv4GO6egwLsHy5p6Y6HvM0ZF/tSgLF4GVq77mKL
	qodpaYsr+McYvBktEZSsM+U=
X-Google-Smtp-Source: ABdhPJymSA2Ypd4vG05hjGEas+41ANMYsYY4+pQnEDdDw9xGG/TxE2QSAIMqS+d6JgyDgC4ZRoO3Tg==
X-Received: by 2002:adf:aad1:: with SMTP id i17mr6905727wrc.360.1598774192395;
        Sun, 30 Aug 2020 00:56:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:dd0a:: with SMTP id a10ls916884wrm.2.gmail; Sun, 30 Aug
 2020 00:56:31 -0700 (PDT)
X-Received: by 2002:adf:f388:: with SMTP id m8mr6663550wro.338.1598774191776;
        Sun, 30 Aug 2020 00:56:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598774191; cv=none;
        d=google.com; s=arc-20160816;
        b=ichLdZTOP6HiH30oVMjpLoqWXacTeqR5UQu6Jg+XOz/YZaL5thfBtO5N+uSTCFKCZv
         PB3X5vWPyS/eYA0mDTT2CEj1l74mxfv0dHrb5IWGoAFoJX5GB8qkMYoK05P0k/R5c/FS
         p8hiatOisa+4SIqnKzOINZHAi+oe9YHSyFlIsx8Xm3XFNrZv2GSeqJw2LBNTUKYnlT4P
         h2iEybW8+qbbl9nfpkbZY7kyZUIgQwH0nKDGSYPN0LutxZgexQy3OqJIvU3MiIBYxbgd
         qS1aL426kQLnR+q3wd3XZtWNC4kijj/5v9sKRNpwQX1cmp+fvUxcfdVlPuoDLDawPhus
         duCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=AFTu84LISZYMY9IfZ+0TRKLtj10SXkBasLqhE6HobuQ=;
        b=qOJHQtJOeQV45WqsO49cYzFDEqRHG6XjzUr85z92NtB/66XmhewQKDq8Q5AhjGiOGY
         puOW0hj/tP3B3XI91w6av7pTU+0UWoopq3DLD42wODGLXP4KOl4pIshJJKV0ulS9VEUc
         oMrgmGo1aWcw6OPSSaG00z9q0VnwEpHDIDHKDokvcrw/8JI4fuMHSWpne1bQB1xxHKWA
         DqYacQ4/74JNNrx2Y2AKTT5/FwXMKXFtkw9Lno+J374iECeTXw14YH0uBHuF0CCXIJqo
         NxfMLCBXqA5HAUx1yiPWhayDLLwWIlol7/EiXawTveT1hRrAPBnw8jOfH30I9EbLKapc
         PFJQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="eHR/6HBE";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id n6si119617wrq.1.2020.08.30.00.56.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 00:56:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.113]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LlayN-1klu481JTz-00bLS8; Sun, 30
 Aug 2020 09:56:31 +0200
Subject: Re: [PATCH V2 3/4] arm64: support SMMU-v2
To: Alice Guo <alice.guo@nxp.com>, jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com
References: <20200828084425.21282-1-alice.guo@nxp.com>
 <20200828084425.21282-3-alice.guo@nxp.com>
From: Jan Kiszka <jan.kiszka@web.de>
Autocrypt: addr=jan.kiszka@web.de; prefer-encrypt=mutual; keydata=
 xsDhBEq0i8QRBAD2wOxlC9m/8t/vqjm1U9yQCT6OJ2Wbv/qys9DYM0CvcOTDMWQwmV1/VsZj
 KR5YgB5NPt+To7X6x5cjz15AGnx5Fb8Wnrq8EF9ZfHMwb7YMx1LdPYPDnXr37wE3XupFmkHB
 Mes4htyX7Dz8LvKDLnli4IsAmWG+kV1JI6LWKXLpSwCg8JRq4SWoB4VCQxbH3GjntgvwNc8D
 /2q5Dj0urJ7s7sdXhrH0hcFkpSFRmU5Yd6MCwcbFHm2paL5gqVjNNUUwDBKAL9eZaQVIHKwC
 44BvNGO2gcQ26R3AuCHUQ+pZHg34tok1JCNZ6IEZccb+33Qq0qbcDMJJiDYp7ppp6ozifvc4
 YaqJECX48IydxfE9+41oV7T5vNAzA/QL/UMJyTnu5jiOXcyn5iFQw535lXkwKsqeXzCowLho
 HICZ2jITJPdTT/+9pGWwMQqST/SS35Tx4EnS3z2BWsNMCLuXCPkxF1elaMJqMfMJxFD8rAgS
 9GK6zP6fJlsA1wq/UvKSL8v4QPOnTNCVOsyqJVasGV0ZPcDfcj+ClNO4zR5KYW4gS2lzemth
 IDxqYW4ua2lzemthQHdlYi5kZT7CYwQTEQIAIwIbIwYLCQgHAwIEFQIIAwQWAgMBAh4BAheA
 BQJOpoNtAhkBAAoJEIrUrG965ecUOPUAoK+Rh12KgCjplHAS0AoiGKwGOuq7AKDEVnBtRAoy
 VRvp3lOlOx+P2Ay56M7BTQRKtIvEEAgA2/PlX6oyi7dToH0CJCHq0eKmZaa7CmGaVnxyeepK
 vIfiM8n8Td76AbG64fjREMwgSpb4F/UytF3z/03tj4e49W/zKjbBRB2/wmFRlZBC9crg22Q+
 bgvMOsxnC6uHXaWN8fL+jVei/5OoHOoFqaMsX8EvploitlI/BPj+VgW26jksf3YZyk1hncls
 Z/IYhXzgRmVJo4RiTW/YLQAkwndwc+fKPa/IYLEDW1Jc4kNLoK0P90b45zju0hpl0C00pVOR
 TOtzFK9G5Ha7qOAWJfAVJORHKAkkvwftf3hkpPdLyvZUWRHXvUexmA61fLvDBAFhRxYGD8t5
 gz88SF5Tzq+0ywADBQf/YSkaYrEslPWiCA2wU6EW0yaqBQAobFsOMvsufJ6o2ntq5Ncq37VI
 3KCT67eHPE9x+zPcENoZWsRrC9S9PCf1LOsi7ybZsR13AJqDFlRzJZ4klh9QwgwFZxUBzOdI
 vttwzG1QkzHx06RKZluFYpPF3DRduSMukdIJ2wmWCU+ohB+mYefe65JGjYQfHVs8mgYVFOPx
 bRea9VJACCMuspoZWpj43UdR1lLLyIUFYz+jqcPW7Hd/GTIw4N67pYl0dwPDmFd4ohJ5g4Zp
 q61toNysBGEuEm5GCcn0VmGtQpSYnR5cVm5b2yPz4bIuFOSuZUo/l7vitdY0iy0/wvKbBC+N
 K8JJBBgRAgAJBQJKtIvEAhsMAAoJEIrUrG965ecULvAAoKGvxs5T3IhyQT8I8sMsyAvCE4wH
 AJ46S16yab+OxNkvOeoOEX0EnHVHaA==
Message-ID: <4ad83901-5903-422f-6efc-b8738f88dfcf@web.de>
Date: Sun, 30 Aug 2020 09:56:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200828084425.21282-3-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:FGdAZBtyFQPCxOxyCcTXBeD9WJL4zJcZuPSb8+AUBE1ZEv2oO9X
 AZ5vsHNjZDkEpcT0qz70WMxPcMWeGcnA57eS1E6pPC9R5QUlM8dBfxajWIQrdv2QE0PSZC2
 zhBfxS9LCowDTn4+UwMZhB9whIjZ4BrYb8SJP3SEXAaruTAc1D1eRXGMvzTcTZ7JVOQRMUw
 8ZvcaiZNrFcXYg/tWPW2Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7C9VNzzRiJM=:gErFoxajbWXtwRIOlEtCHh
 H5/l8K6h7i2OEAJEmkwtfeM9kPDiRIKtipOLshMwI2N3yQAjcLRnC3JibutQezoW8uxC7oOEl
 CX2ZOlD5FGwYFfz/U/UDvTbWlIPE+Ero/ujRIvrFaQb7uEGud199mQnuYr5EzkNURIVgG3+7g
 9K32G/xfrqG94M5A1Y9bFN2miKiwayT18/+jWjkRQQxNpwh846nBOUTiTEoN/tzEClGbI5mGS
 EfqD79gS+KhCeX9GwKzJeVSjpaKIi6KWHZewpJxrWuma0cYM0TWADI+16Zw2xXqUPiMvjZxe8
 KD3AzemxCxJ3B6Zur0blYIzQCFVYIytO+jdaFa87rJ5I4pUbt98j+Iz7Yl1gAy71rU+w65r+u
 OZTWXhloAZlVoWgjkQOUTRsJ0vyl/zW7S4oyNGfhmX9jR1otuRexgDTiOVqM7+G9Wj3yRhuDZ
 OLscqgFG3EhO0sguesb4GvMWdBYlCCmtoerh22XqFKORcUqLGUqb9lBMlpspfeFcsfZ0WNGsf
 X25XopwEkKskyRYrVyFKlIrkVenz/rivxsLkRjDHNjGDlrsFyOipXRmixOXTr5iDhguVDhq1Y
 /wiomgEkpbqMdFL83YKfNFNljUzckVjI6VVQt6ChimnK5u2kdVNvyN47ameHwUUq///3Lq6v0
 +oJqvajMmKNxyrQFD9bEM6DV+3rvAfcMuhp838//JmdzKIEGb3OaPtlQ5PxDxyM5euxzPy/9M
 KlnUwyQ+EyL+bfTJBuLmKCU3P+F8r0oel+p3gnMCwjkxbP04grNXf03flXh7rgoq6jjav4Ixi
 Dm4LQvLTICad/yBWmnHntd74Iv6KQSvRR9vxHUBHB6SMEfG6CliJLAUEDWFPqulUZPYyjNvKc
 bhW+ddUwQq6j2eDO8clnY971BrVz7/6r/n9E1l3HmVrpPJMl0fdFBQVW/6TDqJvUMuNpRJ2IT
 HAS95R4HV0zcIpxn9WG7kIBEJMimG/kyMlYagvKrPKEcJKMLXqWic9JJL6TFie84+soBNHbvd
 xr0e1C3MRkOvgLKzcKxPR8RoZWTbmgFCMisEKuIlW/LhmxW9qDhLuVA5fCYCi8azYby4LCpjt
 Z66mopEIB/9GMnD2reh2oa62ghGCLff4inXtmm6ByLXd+KP3vzqmjatslCNKOdO6wY5RRrC6T
 b/nsASclrxo3dvYuqCd4e030M0cXLpVNgw14rXca7yPWNnsxH/unYAuB/0CJzg469B5zbd/jR
 50XHkXpJBkxjTKnStns2kSrz3ncngW57ucD/LUA==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="eHR/6HBE";       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 28.08.20 10:44, Alice Guo wrote:
> Enable SMMU for processors which use MMU-500 to implement the ARM SMMU
> architecture v2.
>
> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> ---
>  hypervisor/arch/arm64/Kbuild                |    1 +
>  hypervisor/arch/arm64/include/asm/sysregs.h |    7 +
>  hypervisor/arch/arm64/smmu.c                | 1092 +++++++++++++++++++
>  include/jailhouse/cell-config.h             |   15 +
>  include/jailhouse/sizes.h                   |   47 +
>  5 files changed, 1162 insertions(+)
>  create mode 100644 hypervisor/arch/arm64/smmu.c
>  create mode 100644 include/jailhouse/sizes.h
>

I'm far from happy with this yet, unfortunately. What makes me very
unsatisfied are specifically these two points:

 - several of my comments on v1 of this patch where not addressed

 - the code contains a lot of dead stuff, copied over from Linux but now
   effectively unused -> review of the resulting code was not done
   thoroughly enough

I would like to see the following meta changes in v3:

 - drop anything that is SMMUv1 related - dead silicon, no new designs
   will support it (and we will only miss support on the historic AMD
   Seattle - no loss)

 - drop support for generic SMMUv2, ie. demand ARM MMU-500 - that's
   what's in the field, others do not exist ->
   JAILHOUSE_IOMMU_ARM_MMU500

 - switch __arm_smmu_tlb_sync to a simple ten-million-iterations loop,
   then error out, no need for the (rather questionable) optimizations
   of the kernel; and fold it into its only caller
   arm_smmu_tlb_sync_global

 - drop unneeded global_sync_lock - only called in synchronous context

 - split-off the sizes.h addition into a separate patch (I think I asked
   that already)

 - split-off the cell-config.h extensions into a separate patch - and
   follow my guidelines in the v1 comments on its design

 - describe the semantic of arm_sid_mask and how to define it -
   important for other targets like the zynqmp

 - check again all my comments on v1 and make sure they are addressed -
   or ask if something is unclear; specifically check error handling
   again, there are still cases open

 - check for dead code paths, specifically because feature flags aren't
   set, just read - also make sure we do not miss anything valuable
   because there is no DT telling us about certain features

 - make sure the coding style is not violated

In addition, I have one important functional question:

Why don't we need any TLB flush on cell init and exit? SMMUv3 does that
(CMDQ_OP_TLBI_S12_VMALL), other IOMMUs do that as well. That looks
highly suspicious. If there is no need for something like
arm_smmu_tlb_sync_context in the Jailhouse use case, the reason must be
documented, ideally with a comment at the end of the unit update in
arm_smmu_cell_init.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4ad83901-5903-422f-6efc-b8738f88dfcf%40web.de.
