Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBRVPVX5AKGQEG2QTZMA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CAD256CA5
	for <lists+jailhouse-dev@lfdr.de>; Sun, 30 Aug 2020 09:39:51 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id d8sf254656lji.5
        for <lists+jailhouse-dev@lfdr.de>; Sun, 30 Aug 2020 00:39:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598773191; cv=pass;
        d=google.com; s=arc-20160816;
        b=qXF1PCws35OTQGAWOIkU0g/hFTCKrKZ4NKGtFvvWxTlowsuVN4Gq8WC62eMgjCjA38
         T/TAm65icgd+9RvpEPnblS/Gi3W0YbunIRbFqKyOexF//KRCEMUgaKmw23utUnyBdlp6
         6Jjzr6BxRSwhWFURgZws0fDe4PcxxQoASjvHcx+s1m9kdfMlyUObbFhllcpJW0fMoYaL
         U/t21e9FHT9Xgga4l5R3zo0rJaOVn3J+xY8R2aa3Sg9Ofr6VU1u9AUYk5sUvJMEOIhJq
         7QnDMrGgKUo7k4ek9S57PlCd9B8xihIUbmQwWv+eUwSmM2nCExW/EwwRUnBEZ6630D1K
         OQ/w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :cc:to:subject:sender:dkim-signature;
        bh=KH6Fm/VZKpFUfkCTSLkMTdpscNvMxmNYkRYHeTvVbE8=;
        b=iLJkTYSSDd1cR/U3gAiJUHJHNgpqtq1hYV9n5vFI6grslqXh7N6PSH+4rzpEeGBjyt
         DYTkVHZKYpf1MZOJvQvapgs+Mh/yp19tUS5yLfkUDGl28S0O++HbTKiQacL8aISZCcsf
         r27mJWv3Lw+Ok+3NDslvypvdevn8EinIqPskbuNQg91KBsNo+jAFbOUf+A0H7wao1YT0
         YpNtUpuaiKG34A03xXFbeksft4/kdTE9YqRju2WUTrtaO2jX0B+d0ez4D5l1T6KIMwru
         sruw46uXkczhSAKydnoqQ/3r4g9WlPShZEugXWY47BbV/X2vz/+kPrZR+wEmqtUzTRC0
         FDvA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=KOlf0nwn;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KH6Fm/VZKpFUfkCTSLkMTdpscNvMxmNYkRYHeTvVbE8=;
        b=EJgbwWLQXiwYrgCPK+atMxvhEcGrtAnQtuff6Q6t4YwIHIzNmvIB+5yMgYxGPEX6uq
         wGBi2WKEc5ha+9tRjTqehwFUiFEHrlv8kN40xKweZhvIEgwmgwXChHliGi/nudWcCQ6I
         S719mT7mi++l1XnH6MaCCB4l9+u7RkR9MpbM1rjrlkwQA7T8IB6lL5RMmUwwXR3zbGJU
         TIarHGz0wrk2AgWF5FAjmzI92TL/obOQfiPWsuaW9oT0loZlPgYZEk/yC1TS/3ANx+hQ
         DTMGUXEwWHomVbdxr4xUkNGDVI6BZJQaRVVdgrcDbNZYVUw9rPFOeqHvAOLSrATpPc/u
         k6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KH6Fm/VZKpFUfkCTSLkMTdpscNvMxmNYkRYHeTvVbE8=;
        b=GYF+uvAPoWBjDvqt6nUER6jRf1aqKrIq+ngakVbGbh5uQQDzfXjZbSbjvqSdyLmOWP
         bbG917+7cHJzAO+paPymxTG/Y1LoUYFp0dOAMQIbxMaFXMiXLFMFPx34H1+QpsFMLxAc
         GPZBUVsvo0Vn8V8FWhqjZxo6H1ATNQJ6C16YZJ1mNljcQD3n+LWsLK7ojZb4ko+yy+X4
         UWasYGGbqLqqBjXvsuLcjB0BZkvctOnPDSqp76ooiCyFd4kFNuPdXEhypAbGPHckPzSi
         XoFLE4rnUaL9V2vXtduOctcyRkSgFP8CAfDnLuISOta3uod+IPcahsKeSEripP3oUHO3
         iGuQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530gWJwH17QNQff4e3UFt+1VPXwck/QHvyLt+HLm8cLb8VBe+rT3
	rFi5nyCDcXbMk5Ta/U+OdZI=
X-Google-Smtp-Source: ABdhPJy0bij+KMcMZz5uVLhRV22WvnCyuarBNBoO44/P6FhURodAe95RgM99odTqti4rRFw9vBHjGQ==
X-Received: by 2002:a2e:a483:: with SMTP id h3mr2900937lji.76.1598773191139;
        Sun, 30 Aug 2020 00:39:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b4d3:: with SMTP id r19ls490776ljm.3.gmail; Sun, 30 Aug
 2020 00:39:50 -0700 (PDT)
X-Received: by 2002:a2e:3202:: with SMTP id y2mr3071958ljy.30.1598773190215;
        Sun, 30 Aug 2020 00:39:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598773190; cv=none;
        d=google.com; s=arc-20160816;
        b=Q6UWzWV1XxWcuYkWKlBpg2cpea2V8QKbAsU/pkdHzKeiocdHswwOU187frZ/H0ERg/
         3g+Z2ow5jIHIuE5Ifw1wKcSAZakDB5s77nP9nQnDQQWuXhAAuDX0qHJr/GZnSmA01y2f
         DCBhdck7j3MLzBC28vX87TZvXfRbEmcIC7gG3FZJkJoOA1oejmHFoKxCWmNd94+q6Gpi
         bl3lENLDS53ErRYdRqx6XOYVNzranMC8KQZSumF1IUs3xIqX4tZPSHMKPTH+kCPSmTHk
         pQkp/ju5n3QOndCvGafnjw7OEHWD24sGO0UsstzxtlIgSoi5N9jtQX4oQpnWlUnIpHL/
         IxUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=ipc/ItO3ZYTxjU+Ka3V0pz0rLePYIIvhqtt7ksPl5ts=;
        b=sp83rwzm8/b0omOhDbzhDsKR6V84LOKgC77CW8MXvC5TTxdZnAjt5bRJk6cUi0Ntl9
         pTx9aLvgWteafDYl1vnRkVKfHlWwaChVJG/rOT0jU+WQxAISoc0qgwWDuoJMouozFddv
         S1Q32i3Y29LEL5zNIUaqadbhgApu5irifNWLcGbHj/mM60McafAkFZkRd5wRrxAyvFJ9
         OE/mkJOW/syiefpBDAi1R/tFtAK44YwcSNd7H1ikToCh1+klx4Vtvsxxgj0cJWMSxie1
         lUKtMwsoy0suG2sPcODbiLUyvnCTODFVPwmgbRpTyfncFM/++rhoogN5SB2o9PUtUWeS
         AM8A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=KOlf0nwn;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id r28si171173lfi.0.2020.08.30.00.39.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 00:39:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.113]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mx0N5-1kVJni1kTb-00yKqM; Sun, 30
 Aug 2020 09:39:49 +0200
Subject: Re: [PATCH V2 1/4] hypervisor: Provide delay_us() for ARM
To: Alice Guo <alice.guo@nxp.com>, jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com
References: <20200828084425.21282-1-alice.guo@nxp.com>
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
Message-ID: <4d070388-0507-26b2-f7e4-a307d43cad05@web.de>
Date: Sun, 30 Aug 2020 09:39:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200828084425.21282-1-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:gKMo77+JNXfmAlRmusnthCUChfOtwefhwlRI7kyGDrr8nujOb2K
 gqpi/11NHUY3DBV2yEJTk9s0fu0MgtsDFW+kw2C4jXCATUI1Aprmjt0I6Er+iq82pSMZ+BB
 EDfwzuNuNYmNQGQh8IOYcLbrDlSenK0m4Wq9Bb486AJrCkpwbrJQbzh1CzOltkfLAqR2Clq
 Okly6gRpl7vOi0gvJ7IWw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0RTq+y6AuWQ=:LgoZ1kRKxBXuBBoOg4Rrl0
 nT/O+U6FkOLh8hDJ5ARc8vyP2rdR0GmZ9flwh9mDSxZzDXJ0+0jhwOSaw39xE5BAucQh3NFYJ
 sTUEYhQOZaHVzZvSTdOOva1CgUhXbMgajNN1lNxJlmY+WaaTNYuymWtjT9zjJxIHX5qQsbooI
 Y9ZCOzsWeEFZePFU3bmKT3KgTRmaeqhhu9EHKJZBZUtYTCqYW/l9nV4cTbpURN3VoFduVghce
 68xFLzpPdTUOFT+H2cMPXwnwt3VC6ebFRqcb6gu1SjB3QZCiruX+VsSmhtaMemWlOeqiio99b
 1A2Xt95mrcAr6dewEfSuFC2Smr2RXJIctYDEA2bXLjIcy0ZZAgwBfcfT6UdDgZM0v1mlFdTgd
 51Kcgk8215SK1IxGhjThs3Rdxwggm88xPJZtE6E0NJL7nSTNKNpr/nPxlHzlR5Li4nmGZixNL
 /A32kzVAIOkA0+AEzYd3TajzOENCjrZL1OoWxXHMWtlaStM8LwWwSXEwUE9+qzWDlqltFplZH
 ZTWD8p+lCg9Q08xEw+0taDYz5CocnYYSeolVLsEEODw10+u+LPTuf95IGyC1RV9XoXzpSVjAl
 4sSTnZBcsrbP3XXKEGeO6IiYUnTVn8VjNORamRFvqEiR+TfXF9rcFdC2o4Eirrp/sQtgojZe7
 B2/Dg1BxcDa1VSRNudV3MAQAgv0Ffv80RQ7rlf/0voyilMpb+rvgSjn5PmxgRAArBOgqbW+4U
 Zw8t8+6h/YF1fT6w/EM/bwAMkEygiXBpucFV6yCoCu+lVZ7yNmnNmEUeZzzUWccuRrR+IzbzW
 C8RRuj8xU5ZBZkoMlAp0aeVJDB7De2GxVJmE5z1AWCZxNSu42o6brH9gGDWbET54W8I21K+iv
 EssMzLva4xJnPIB5uHjqp8p/9DfCtmQ9y6A6f07Khjn/UbustNdUR6CDYgQ898DqKFESpOdry
 ZeQnwHmSuOF9eijTeI6EINQCTcNtuTjoKuRtykCzhBpA3G0lkAcdd69ORPKVKysb9botLr++W
 ZpJmeRyJLjV4snxh6qt2pWfVTk2HES6HDztvGSCsNpc+YZlJGw7CquzG5QxEPOE3L0+PpHJ0i
 onF8ugYnTGCtNt+bgT6uv7dNrx7WWleAog/IU6NnI4jY1QDgzKlX719S0Z6jM0Vx0tinPm4qV
 Kxz6f97vgOSE1okXYShhqp0CpqYY+j+dwpoIewQOTC3zqd70dzcRzPhAYds40/0xA4Qqhau1Y
 D06SZ0rEJLnkcJGRkkf0xlSIK9NK2mlOJDgsOng==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=KOlf0nwn;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted
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

On 28.08.20 10:44, Alice Guo wrote:
> Ensure that wait sufficiently on faster CPUs.
>
> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> ---
>  hypervisor/arch/arm-common/Kbuild             |  2 +-
>  .../arch/arm-common/include/asm/timing.h      | 17 ++++++++
>  hypervisor/arch/arm-common/timing.c           | 39 +++++++++++++++++++
>  3 files changed, 57 insertions(+), 1 deletion(-)
>  create mode 100644 hypervisor/arch/arm-common/include/asm/timing.h
>  create mode 100644 hypervisor/arch/arm-common/timing.c
>
> diff --git a/hypervisor/arch/arm-common/Kbuild b/hypervisor/arch/arm-common/Kbuild
> index ab86eca6..86ef9b86 100644
> --- a/hypervisor/arch/arm-common/Kbuild
> +++ b/hypervisor/arch/arm-common/Kbuild
> @@ -17,6 +17,6 @@ ccflags-$(CONFIG_JAILHOUSE_GCOV) += -fprofile-arcs -ftest-coverage
>  objs-y += dbg-write.o lib.o psci.o control.o paging.o mmu_cell.o setup.o
>  objs-y += irqchip.o pci.o ivshmem.o uart-pl011.o uart-xuartps.o uart-mvebu.o
>  objs-y += uart-hscif.o uart-scifa.o uart-imx.o uart-imx-lpuart.o
> -objs-y += gic-v2.o gic-v3.o smccc.o
> +objs-y += gic-v2.o gic-v3.o smccc.o timing.o
>
>  common-objs-y = $(addprefix ../arm-common/,$(objs-y))
> diff --git a/hypervisor/arch/arm-common/include/asm/timing.h b/hypervisor/arch/arm-common/include/asm/timing.h
> new file mode 100644
> index 00000000..145beb6c
> --- /dev/null
> +++ b/hypervisor/arch/arm-common/include/asm/timing.h
> @@ -0,0 +1,17 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Copyright 2020 NXP
> + *
> + * Authors:
> + *  Alice Guo <alice.guo@nxp.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#include <jailhouse/types.h>
> +
> +unsigned long timer_get_frequency(void);
> +u64 timer_get_ticks(void);
> +void delay_us(unsigned long microsecs);
> diff --git a/hypervisor/arch/arm-common/timing.c b/hypervisor/arch/arm-common/timing.c
> new file mode 100644
> index 00000000..ad4a5a86
> --- /dev/null
> +++ b/hypervisor/arch/arm-common/timing.c
> @@ -0,0 +1,39 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Copyright 2020 NXP
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + *
> + * Partly derived from inmates/lib/arm-common/timing.c
> + */
> +
> +#include <asm/processor.h>
> +#include <asm/sysregs.h>
> +#include <asm/timing.h>
> +
> +unsigned long timer_get_frequency(void)
> +{
> +	unsigned long freq;
> +
> +	arm_read_sysreg(CNTFRQ_EL0, freq);
> +	return freq;
> +}
> +
> +u64 timer_get_ticks(void)
> +{
> +	u64 pct64;
> +
> +	arm_read_sysreg(CNTPCT_EL0, pct64);
> +	return pct64;
> +}
> +
> +void delay_us(unsigned long microsecs)
> +{
> +	unsigned long long timeout = timer_get_ticks() +
> +		microsecs * (timer_get_frequency() / 1000 / 1000);
> +
> +	while ((long long)(timeout - timer_get_ticks()) > 0)
> +		cpu_relax();
> +}
>

My comment on v1 was likely misleading: The Jailhouse core has no notion
of time, and that shall remain like this as long as possible. Exposing
such an API bears the risk that it will not only be used for the more
harmless case in the SMMUv2. So this implementation should not be added.

Looking at the concrete use case, we can do much simpler anyway. Will
comment on that patch.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4d070388-0507-26b2-f7e4-a307d43cad05%40web.de.
