Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBPH4RD4AKGQE45CKR6A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C28214FA7
	for <lists+jailhouse-dev@lfdr.de>; Sun,  5 Jul 2020 22:55:25 +0200 (CEST)
Received: by mail-ed1-x53a.google.com with SMTP id cn4sf40205230edb.9
        for <lists+jailhouse-dev@lfdr.de>; Sun, 05 Jul 2020 13:55:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593982525; cv=pass;
        d=google.com; s=arc-20160816;
        b=VATbk8M0iOjR731qIpj5SALkUknSz9KVzmyNXZi//M4oP107dViWAZ3kKdKmg8bGsD
         07zzFTlmpFl319IBStjMvqUJozacKBjzlis3gU1owDBeIt2lorWkYm2XsM9CERfVen5A
         BWZJJlLp530mX3cCa7GnKEn3Jh17Z0V9K7TIKfYZIAMblZw1Xp3AJ6VJEDP7ggz95jB/
         k93OW03JQ08EWjNYHYMrvKb+DG53sUd3lDMVUpOZ/v0dQnh6YMtoC5UpGGWQ9G+DCsY4
         VGaxKPMclTIUz9PvXdEC6zvFy2xCi1imhwk61n3X6fWl0XswFBdR0Ixlt0t6Onwirm8q
         UAMw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=J31FfWjphHc3l85ToDazfOCeOf4HAuT1s2XA1yN+wzg=;
        b=EesRR/4sbAnMGsT4B3X6vaYyHkw+bV/DxGPppNzKA/U/UBdFYkGlVGjfPMX0uFzOSj
         lUIBT5F166eOTq+XuzPFEQdm+Vba91IxGjkTVCOnaiMcH2SKDzQER6Qzs7LaZwZGgsT9
         EaMjjpXzonBikldx5hZI6Ld42sGckdlht35QnR6aExdo68PYMEA5imM3G71VD/SPTReZ
         CZ9M8DMbTHgEYaOKJ3W/6IkavLBA/RevBljSzHBNMZp/IZQXopUHjgJG5W7OsM7/J2QC
         qAjH7gG4ks2ee+UUzWDulPXcUY6J3yBOmA6vl2Xb/jhybIWkg2LrJAxZOfU+iby1NcuU
         BGpw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=F76jXoT8;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=J31FfWjphHc3l85ToDazfOCeOf4HAuT1s2XA1yN+wzg=;
        b=Gum/DfSM2Q936RAwwNNJy3uOg32Pr/sIhCBxEH4erKmdk0yRHWbPM/eVeTLJheweJ3
         KHx90qX5Hvo0IkYgvwcAPo1TIW4KxLOX5S6MSixHA7+JlidoUjmvFhEAMA7oeLgEKjuM
         uOKJi7Ia34dJQvzQqx6PP4oGDNHMfXWqYAe7Xs1vLUPTHVd+zDArEBxUBRpLLjYpQIgv
         hc6di30/Q7MID4cyfHaFtIDnZG9bRed4Xlpo52MLuLMwCuD/IRF0uiUFNoFFAvDnw8nE
         2R/dkVs2amDQbCU/WdtEGRcoh5xgTvv0Tw3yZOIbMFo/NmKi2eiuYg8P2nWE7NKh1GRx
         mdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=J31FfWjphHc3l85ToDazfOCeOf4HAuT1s2XA1yN+wzg=;
        b=HZ0VPl+UDxILyBUjBBggvo7+htIIto0LoBZxglmXb8xhl70nfOkv5uTxTbZxmLxE7w
         yWEPFrX2G7/0eVjrTYTQElXDPRINyl2d7DR7e7S/0ebQkBkH2CGzS5Mj2mxHZVJJR4Xk
         cGGAmZneJkPQxh5vCxOBJIOEnVcZ+0xoaUU9YCZ48t2blOF24iSEXsq7BkvW5oFPmYrI
         Y/3zD+P0bM/+7oPzCSEFcCox0TQ14PjznuZhYUKgy4eEI5Wvl7JM3qtFZEqJ8x4MS+oL
         uuWcc8pO6gLBtNbiql1BaJptMdOLejLu9LCInquy6rJ6evQvjL5QOQk0i9ygAqD81o8j
         wqcQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533iRmCgIE2UP36f0Ao4jGlOgrkiE+pRiJ5PkWatEAxIQOWUHAGM
	vDH5E1ax4RN0UbERAQ+zQgs=
X-Google-Smtp-Source: ABdhPJzrMnAGqhQKM06x4GGz5Aaygm4NjPMgqEcsAEjmf9hgyQK10iXlSBkn/Jl1quYx1hxUqG0Q7g==
X-Received: by 2002:a50:b964:: with SMTP id m91mr54715291ede.37.1593982524962;
        Sun, 05 Jul 2020 13:55:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:834a:: with SMTP id b10ls2420571ejy.3.gmail; Sun, 05
 Jul 2020 13:55:24 -0700 (PDT)
X-Received: by 2002:a17:906:76c4:: with SMTP id q4mr42971287ejn.371.1593982524385;
        Sun, 05 Jul 2020 13:55:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593982524; cv=none;
        d=google.com; s=arc-20160816;
        b=xHkDzC/bEybTSVFmK4lP9BlztGrHnys7O4t11rcFK4C1FOXfeY0gsZQEGSqf62UvQ/
         mrBB4L+yxMCyYUznVAHiOJkGqVF1F27dWiu8VXf6WkMr1SGimvB+paDyz4Btwt0WJz/K
         kRZeQIX1rMEiwiHL8yQX0CD5pEZPBDFevlVw1kxLoPF4AsFYmOx2ZBfI2H8zH2YR7om+
         2dDs7fskgF5UzwAhc3rtOB9KhhslAJ5uGC9bTSpHMlNq24VIWptgr1OlJjOnu1PgoppW
         2AGY4bBPvgPYNVvddlmf1AsFvD4TBbbDbYlodDIYJRSdXfu6WUfCJjdgu+5z+ZnT4vji
         Kd9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=8arYJfmWdw9xpNi0moX1JPheY5NIBiuM/PZ1X/I6vRc=;
        b=nX4MlBUanClH3D6MM25DwOlobwX8qxjiMfaOfC2RGP9trrfgqOxf3qs6EkfYXkSl4L
         43wGzAQxegVUuI0E2mk9a6gqeQWm5Rxnl8Hy8rYRpxC6ph2pOIh3n1wTecYgxUM5QRGT
         Qoqqe5kuClSNyjWGAvPivK8kqqQNGlrttbp7hphBmjf41Mj+Vd9ZL/wweACEkQatBVOV
         lTuV1RIXhDkWHpyzlvx+46rd/dW+JKHM5YGti+7EzKblQXfIpj1x5V+whBfo8qFVmIe5
         QhXnfeT72tijBBmp5MMdIjfJXHd/GZCtePX6e5d5I8F5SFpmfCAUpzf9YYI1trG65RRE
         prOg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=F76jXoT8;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id q9si1151338ejj.1.2020.07.05.13.55.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 13:55:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.2.196] ([92.210.73.173]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MCZP8-1k0OrZ3jQw-009Orv; Sun, 05
 Jul 2020 22:55:23 +0200
Subject: Re: [PATCH 01/11] pyjailhouse: config_parser: store binary format
 specification in struct.Struct
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
References: <20200630064228.4742-1-andrej.utz@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <1004a1b9-70fa-c8aa-8f50-552b12155a3e@web.de>
Date: Sun, 5 Jul 2020 22:55:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200630064228.4742-1-andrej.utz@st.oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:tNlNM/5TanXiCEnUEhNmCMPPenWVkrsoSNeQXX+63Q+ZIbWbXjr
 BZMk5AsgHtZ8j90bth06z4yfJ0ZRzOqBZJT+EeuIWwzKEXNgPSTPubeB87O13subLjezwqW
 2XAROVPELGBvhaM2/ouCDMR9K+VzzIcypeD/aAntVomQlrVhZhQsOU/IzuXxFNDLBlpO8oc
 3mj5pird2FTWi7vDRE3iQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8vQMc7/N39g=:9eOSY/yyFqnqOm9lAI8+El
 gHAn7SuU114mezOxRKDQWHqXHmaheBkr6GgZeZp2I/GOAh0alIhzPYRGdf7YHIT7KVfOZhtWI
 nTWXuRVCzHo0WAvtAL06l4qVCkXok6reiUrVpzrfL0hq4HhF6KeBdHstQyAuOH4mub6Fj45m8
 qP2JWuVlUNA7cabVoWbmQLke8oRKLOqtBEEgeTgCTjEt9Kax9noGBDdweoQbUQEdvuVWxVWke
 je+550L/TZbZt0PMMuMmb3yeAB1YMAR/EgV5EkrjjJVm1t0nmV8ys/mjf3JZ1yq6OYgDJboan
 SSuGFsJSNYRuvHsEaK0sBSqkTi0qjDr/ve+K5K9j2wmyOcyKmuxZI4RpX33fsCox40ulPbMtv
 KALBVx6NA6lccdAHUeP8VFEdGnPMqqnq76+LjvuIkA7OUCKB6+kyJtNSfXAhFgK1lFoR1hl/+
 OOdquYGWInwCUfbYpVrg5FcyYuWvMLhJbneQ4jMUhkobQZZUQKgQRUwAEIz900NRw/1QYgw7S
 7Y37cmj+/8zHvNja+aKT86ExWllDsJ0Z1Bg2HDqbUTBZJK0/FtCNvvuEmlB4CcqEYMXM2glqG
 KKmYRGWl/rBPKF783qndHG4Eq/2CiPXbl/BFr59jcscdbTemOYm0SisqzFwzLnF4T+aj6noDA
 4CAV7vwqUDt8gqb1hzaZaypg4HaqCFYMWY9X25P8YlFFuAgzxfE8ulzWEsuVguw4xCjsv1lUP
 M5TWpBWSnxAQnnKbPGrMVRmLWwSv9jdCz2+xh/gF1RPAb5ZVB6F9qkxZ9dIV0ysRIkrNDHwAi
 tPJ+isSkF+WYZouz2u6YdW4keLKGmUKZXIU3KqV7vAa+4bItgrF+izfItkSh/V3RtLcNa+2PW
 qiX4U0Hqm16zzDnkXfhFy99Q01GV3nl934taPewa+KJ/KQnjbKOc1biUUDGsMdkLiBMnaBaRN
 pAeUFsiYGKVGjGXOsJ6vzpg05Fl1ElKmSBh8CeZTzDYhBPZRe1NyoLrO6md6Li6/vuUqmMzOg
 9jsQkf43lOIYMBrtzSa5lN8GRKTxApu5qG38xiEWF6NP2icH0W0OqDret/kBzKxIyKQqN+SuK
 orHdJWbM3cgeanndGTfw68JSp5WNS3VuXm+S0h0Folv080UFy2e69mOisSYGrKHTcDZX2MLyS
 p64C+7MQl9Z/z0GsDf4sqO3hWlLbSYC3y/iE/Tfy9v3DGoJbL3HRhLpVCS6bE5we1g7JX9z7l
 PBtHQjvShXp+IUcMT
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=F76jXoT8;       spf=pass
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

On 30.06.20 08:42, Andrej Utz wrote:
> Improves its handling in the code and slightly increases the overall
> performance as well.
>
> Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
> ---
>   pyjailhouse/config_parser.py | 51 ++++++++++++++----------------------
>   1 file changed, 20 insertions(+), 31 deletions(-)
>
> diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
> index 6b9d9066..b75b9312 100644
> --- a/pyjailhouse/config_parser.py
> +++ b/pyjailhouse/config_parser.py
> @@ -52,15 +52,13 @@ class JAILHOUSE_MEM(ExtendedEnum, int):
>
>
>   class MemRegion:
> -    _REGION_FORMAT = 'QQQQ'
> -    SIZE = struct.calcsize(_REGION_FORMAT)
> +    _BIN_FMT = struct.Struct('QQQQ')
>
>       def __init__(self, region_struct):
>           (self.phys_start,
>            self.virt_start,
>            self.size,
> -         self.flags) = \
> -            struct.unpack_from(MemRegion._REGION_FORMAT, region_struct)
> +         self.flags) = self._BIN_FMT.unpack_from(region_struct)

Let's clarify that _BIN_FMT is a class var by accessing it via the class
name (MemRegion._BIN_FMT). Same for the rest.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1004a1b9-70fa-c8aa-8f50-552b12155a3e%40web.de.
