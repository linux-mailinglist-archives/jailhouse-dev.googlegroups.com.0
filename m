Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBNNXVX5AKGQECPA3XTQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AE4256CB2
	for <lists+jailhouse-dev@lfdr.de>; Sun, 30 Aug 2020 09:56:38 +0200 (CEST)
Received: by mail-lf1-x13f.google.com with SMTP id 5sf1200993lfp.1
        for <lists+jailhouse-dev@lfdr.de>; Sun, 30 Aug 2020 00:56:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598774197; cv=pass;
        d=google.com; s=arc-20160816;
        b=kgS/ZMzoaTOrTFvksBhXHS7xunm2PtO5hp4tztf0RyBhEGGQxyCbap8aXRGsLqleP1
         ic4rMybONwFPOZ5gr64/2bX3Zm70cQZz2624qWBY1o3/1UwH5kxun2xfwR9bdsDBv+Zf
         tLi4p7b5dZBcdp0W7BUmDrc/3HOPa/TbIPO671ilekXx4kUpiGCpwBEH4U+3+KywYS43
         RLlibNlegyd3vLNa7DCjQbWxtQPRWLp1Gcog1/5i8BU8oxpWhA08i8yvMyb70NDMWHIL
         pA+71ksi6encqqUFrQneGzhz6JuZ06LyV26Ig/lqkw7XYDEA4ncVi0P4OKAH5YB5ZcFT
         B7pw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :cc:to:subject:sender:dkim-signature;
        bh=idh4UwhjdGQoUFDBFPfOuho3xfEPHe/qOKxmkKNZdTA=;
        b=Parxzr7R1YQ8mUvvHsy15JG9bkn09jkhmvSZ57MMRDpzgr6NeWPjZ9F/J+x3HYsxu6
         2SM5gVrzNyfJLGK3mkItKeReuGgxICLV39CtciamlIK7yZTaxZhYRHDv2Pohb8Np1xJi
         J7J9m4/JC5k0LKi+bJXrWV+3rwrLcEgANS2s2oFXMgHnv/uIoqEq+3g1lfbyWLzAepwT
         YNduiWgn9Aca0DWwje/IMo/ZHx8jM3zMMX7DIbgwcqmCjoBWZJ4dK0G0ylfbpFiTSgEI
         MUBikLW1czd6XQ4FgtfVLvbF/jUA9diIfP7t9TJssqudJBOp5ELpTColfzMHdUJc/Fxh
         PkJw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=GEUKTKhq;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=idh4UwhjdGQoUFDBFPfOuho3xfEPHe/qOKxmkKNZdTA=;
        b=EyaxQD3HoqGw7ycDCAKQZcAkTuo+vAosupzhsWwroF7tLJhjAAGp1RPkBiYE6UdyDr
         q3+Rt+EBpUnuiF4g5jxnrVgZcVCabxzt+wC6I5glbAN7yjIPxZ4JkhP4DDGBlMi5nCW6
         FLCPRxm4SxZOshk4xOt+HQnJGNVvJ+kQdQw29okjGMnibx2jS3XEaKMr9i+3Hf8UgXbh
         Z2A6KZY8zwYxAO74YsaDykGSRlu9E0nxEHuUBp95KjWMFgt6kT0ayXtQt8VCtWy6LJmQ
         grIqpfvH755a9kRrkO+4kvLzKvyOPxwesHvNY+F48/6H99W6ByCK6Bnzzmnu4UA9eHnV
         WVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=idh4UwhjdGQoUFDBFPfOuho3xfEPHe/qOKxmkKNZdTA=;
        b=gEmmdLmpNNeTCnHnvVxXs60rArbrIliAZihmfK+yapNS01SLuN/UDdpYSw0xv++KzY
         XLQ3ibUKlKw55eoTPmqA+9TDOy3McBYirXD1AhajLkf/K1N9jxVCcN6VrMtBd6ysUN2g
         ECxzVdQouEkQGLQpltShqOOb4z3lKdXbkAkQ6xXyyflxj/7eKMzOBYppp9+gTcQIYSVC
         hs8SF2XK+djK0Y4OYYe2ylsM8l8nwXmfsooTwrXWCFLBP/xtuS8Y6EOJxRTzIQN0/wOp
         4PpE89MOv2oDK/YB46Hc2iW48LlIMYqKYD1W31Y7Xq/FZOLhR8v2CyafqRuAcrTyQdbw
         ekaA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53247VTT4PbY93Lkh/tVs0UZCqQxAE8bZ4ZWNEg+IFEIPWR2tano
	WS9DpIzQfUXWUr2z/fzAOkM=
X-Google-Smtp-Source: ABdhPJyI//aXsYmtvNrhtuVPN9gkXX8O3KowGBa2qf8AP8OzDvSUFn2M9t6zxiFZf+EBn6QP5caGwQ==
X-Received: by 2002:a2e:910d:: with SMTP id m13mr3131352ljg.240.1598774197528;
        Sun, 30 Aug 2020 00:56:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5e33:: with SMTP id o19ls790880lfg.1.gmail; Sun, 30 Aug
 2020 00:56:36 -0700 (PDT)
X-Received: by 2002:ac2:5298:: with SMTP id q24mr1239498lfm.164.1598774196679;
        Sun, 30 Aug 2020 00:56:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598774196; cv=none;
        d=google.com; s=arc-20160816;
        b=DFKgSwOqrtdxGDpg9EJIXLYexX7dRQ07rPi/ZUy+PmPnYj8dqWQts8ABEC1zcazj5f
         Ea0KGUzvAxI8jGg3qFMgTa0TjkG9DV5y+V5Q8HNjHJgRGELirnOsAIeeZsqBIhXOqoEP
         Rt0Aq0Np3TUVfWnnRmrrwKJE7ALeHaxLAap77sN5tJxYz2C+dL+Hh7HkZsaRFzB2xjsg
         MUHC3N7nGTLx9yDP7i/pG/wWZNJKBrvxqto1/j/GJXfExAIhA2uNSRAckv2iIJ1jkP3x
         M5cOFxLJlU3ktc74v5RhjO12aBvJZLFB6Eat+GOknlHUJzFzVZ7ER/UFDdEnW+ksHRX5
         Fyow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=7H9JvcVlcfH6hn5oJNy3TvbyWNQnlANUYvAlUoOKAQY=;
        b=D2pCE4dtnx83nBeTatT1Z/GJ/SU6vUL6FgiMTHkZShATpfUa0Lu+cUKpF+OrEDq31X
         RS4/QZ5kkxZyERShFSdXoGOQjoimFMUtRF+CNZYVGfUfj88BY0Gbkqba01RyB9WMjRhL
         +JD+Dfy/Aqcnbax51WzB1hWUhVA1Y8qJf86fk+a/3/ky4LSWe/6bXMwEj8TaFdnNSYar
         afjxoEUxbqcIhM6q3UD16HtIoiHErF4fYc6H3sKcwi6nPqlq0Uz8n3SVal0NBFLZwBVe
         truMtL3BlLxydVuNtX504QtX7YmCny/0m7zoHDrhGuO4vyLlzjMbrYHbAv40R50Vq2kS
         Ugjw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=GEUKTKhq;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id v3si105685lji.6.2020.08.30.00.56.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 00:56:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.113]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MC0LJ-1kJkJa3l6L-00CVIU; Sun, 30
 Aug 2020 09:56:35 +0200
Subject: Re: [PATCH V2 4/4] configs: imx8qm: enable SMMU-v2
To: Alice Guo <alice.guo@nxp.com>, jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com
References: <20200828084425.21282-1-alice.guo@nxp.com>
 <20200828084425.21282-4-alice.guo@nxp.com>
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
Message-ID: <9cee2068-1a77-aab7-1040-e60039c2bbec@web.de>
Date: Sun, 30 Aug 2020 09:56:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200828084425.21282-4-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:RNyfWUntTJ47y7ekZQKR6QBhBL2csWn3UhEankUIup4CajTik5X
 OVDRJaxfAEYiodOvsvOE1TvXJRJk/LoLCvUPYEzknGTnIk+mU3no1rExkwUkLtP8Kscwx5u
 uQ+Wvjg5o6mUzLByB4BDmvN1qBKHIs0lHkDG8VMhyUJDpDQd9aP1TspNvLANzPIyCaxf2h1
 mbiQ7JsZ8P646E0aldXxg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WFCTRd0CH/g=:NSP22yCiaLIIV2G8AnhA3d
 1yQqOAOoerjtOyDQxSbLSDOgpfUXU6XQbbxVJ5rIJbiZh452+x7DUxMO4kjAcWFEyc70AIXER
 gx95IulNHBg8708PkEOdG2Fr2vk+AlUtMZgG59LWdoCchbTgANYz+MqBiTnjEi6slCWTjdk4N
 juj1W6DVyqcCxC7H4VbtHkbECVeCsr9ynjLw7MTxIH+3z5E6so4dysA8oMSDzaM6xo2zjh71r
 mr5RI8LnRNsXngXFjiPvHdImld8OriZviFxUvKb1M6bCL62qTCCof5xNo2zReuW94011vV2E8
 mGpf6b99X9ABYFkAmf4QBrG3nSj0yiPH62HRAXgA1wXjmhSXA2ShyRsi9PljV57BjX0m2NOE8
 igaU4uZpaxsnAA3slLy8qIIQzZQsZraP9xDQb6wa3zhwsATdtJYi853e7mYvSgBCfRTADdEnU
 6OO7dglRkmoIFBXIgMMmVxgVhipbJcJ12cTYcVrMdxv3hEJJfIpD+Wej6rTqprd5F8b72P5dt
 78qkzuV6qcy4FJJr40nItERez0k3LJFEM6qImuUsjf/g83NYVIgSH+DrCATqs37tNqz1WCcCW
 TdfjVr2YJmAWwAKMQuAA03qQebVfu3ogNvHKAqrQM3C6805JAfbuQdhmbv0Z7GArkEMfOwfdZ
 0rYh7RCsdW+PXnOjbr3I2gjavSpKPJrl317qe1PKw6n0oMyD3WkRtTJ8pXAsPApbEeh4qWOvR
 6YBatJj7Q/rb/ReUBhYIf1GbnY3a5QbVetc509SpHUQgbTihzPELBy68erOJXkA0KmMN7r+77
 /v+x7V09yBulcvFDDSClyOlRIVf4DNziY8pNu6a1H8AFw451zspdl9ok82OJSw8JWbSMnDSrv
 ylY2PWLPrUtxFSs8NPh8lVCXG5fi0rebMX5W0vhE1q1a3pnN/TEgx3CTxk8CH5pcPw4AnpG3P
 d3uyQtz3Hh4tACcUEzGcMGWpHqVNqDJrSBUp7M2aGijM3grVQuhS4lAoclTn6SKpyCzGH06u5
 weUMyNFaXv5Q2xU+lbe80/y/cZxS4CX9enMtd/s3qQZrx1sC+gCoSBuwnXmgL0QZtkRSFM/pT
 U0jOIp/HUq2SWjRmTPlJu6d+6hFnJWNwyyAOIBpJ4WyWh2lKzmMCL1fvi0k6RMmTEZ5BMNNnn
 HVTA5piRdSyV0zopRRvLLnMfwDXSTYXXni8dyAli+/0/TvXP5LplwhS2Wr/fJrUuFMQymKrK+
 Mc8/2IQMjgB+vZf8UP6D+F3DBbF+P/W5O3jrwWg==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=GEUKTKhq;       spf=pass
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
> Add root cell and inmate cell configuration files for imx8qm, which
> enable SMMU-v2 on the imx8qm platform.

This *adds* configs for the imx8qm target (EVM?). Subject and commit log
should make that clearer. The fact that this platform comes with SMMUv2
and, thus, stresses the new code is just one aspect.

The other imx8 variants do not come with an SMMU, do they?

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9cee2068-1a77-aab7-1040-e60039c2bbec%40web.de.
