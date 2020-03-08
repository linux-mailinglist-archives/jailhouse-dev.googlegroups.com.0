Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBOPCSLZQKGQETBJE5UY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B5D17D2BF
	for <lists+jailhouse-dev@lfdr.de>; Sun,  8 Mar 2020 09:47:53 +0100 (CET)
Received: by mail-wr1-x43c.google.com with SMTP id z16sf3443665wrm.15
        for <lists+jailhouse-dev@lfdr.de>; Sun, 08 Mar 2020 00:47:53 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1583657273; cv=pass;
        d=google.com; s=arc-20160816;
        b=Mju4Yw7uVGBTKB0/q8oTzenvLrCBKAUre17xkWivsKRK81dLin0bBzcblMCJ9fxE5K
         4Xy3arcLc4+KYDVwxh3Y97ZwP8+411UI0Lv0KCMD1rpa8yvPE8+o9P2hdOMbHIwKpWju
         NGXwoMdqSrnJKW2MV4qpuVT6pIXLkdvg9UCJ2fOrxJuKb2XaIgSW0w3FjGWKy1am6HJ5
         M80Ew+bjjBU89NbJky3h/71v80w0HfO7wLwv2J+X/dk/kxGQYqJhVizUxDX9Pu3qXxAK
         QpfV7DI+tS+BR4O/66G10SJCeC0GeX8gHmBHA4Bd6U2JfzYBPcQUX48QaCc9XHP8a0x4
         2rAw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=OJKLJGIBgM74PO1Np1KSvBlkB/dhSvZ0+52Q6N0oKbA=;
        b=bNOkchb1VmwDQ0BtCplS3GB7AO7wa4ENgDk356rQQbj3uZLjwMkKGamtZWQ2AOX3Ak
         8TYIWt6g7kfV8Km02T6j7pJ6meOERc/kKOQ/HVmJpNVrirCWt8K59efajAhOLvG01QK/
         ykZpve17//cY+yJxrzgnzuOdm8+oqw6D2D1ri/IwkLbi27W+2OHRd23y4cBlk0vaZlI/
         vlh0zisbHU37O2WfYWY2LVxoqjELT2KAaG7FTuEpLrypAK6pbY5tKXq1v56P6TFyIY/j
         WKkiOFYdXNM3sShWZSTsqhWwPvJ7x6AJCZw2Ssci2AA7Kw8tnxcA7cFT5kUG/O2I0HPS
         UrOw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=pZyd0y8I;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=OJKLJGIBgM74PO1Np1KSvBlkB/dhSvZ0+52Q6N0oKbA=;
        b=eblZe52k+e+ZVN9/CJlXFG9vVVAMHSlETG1Ic8HSvLB59Qylhdu0bpFglr42wehbPG
         WPDdLZ3x/W+FgIrhsqy95lYVPt37liFF7kDp/2DZt3P2DAApLZq5TH2/AP4673lFk/i7
         /p0Erj3JW1h35yvuh7nWsKSIf2JyWXByyK6Rza+3RUzpgt4e1cIgdnKS7Wy/f9pnZvm2
         LZg7bualibqJufnymEnmv3VC0vl0daNZrb4ZJa9y6Xs3r9mjVIAhKc/9OOUtJmzhjYGj
         p945+RBwgEvaZpZvfrUcPEQwiI1b1XAbL34kTKHS1KyGDtJd2Vg9vkm7m3D4WzX/n9lx
         DOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=OJKLJGIBgM74PO1Np1KSvBlkB/dhSvZ0+52Q6N0oKbA=;
        b=ZZgN+doyNqtbTO8wfWhOttOAOIsBMs+yGaFPnKn1yQsIALVj4WFfCADr/yiJIiqKsf
         77CUehd6E6u0n/8fY28hZ9UORdoSW+Uz2+7n9oG4HbNb8T42kpncqS0T+F+9QuXLTaQg
         7lXLAs7kX3ga/6HWU9YPnZ2WTtBHfAsuJimvDIHTcht7eDICOS2QNzB7hSAobrCPflHv
         KjUvohbJc1vI/jLG8E2s2zgkZKdPQyS1jooxjhK6qRkgcgoey+VbgTNY84nRahut8qXT
         gEsbhkL0XlTPEDClhBFsLAVxFrWfIND283JCggKLM5SsLmEnfakw1UmG6kNRwaNn/Gub
         JXlA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ1mEEqQLKULpsXB/cgV9tGrEpoX0R9a9EGm3bo4DEBOAs2DTj7z
	g2BVWga0v/QnqVvjsLH+CPM=
X-Google-Smtp-Source: ADFU+vuh+ShsSwM4OXX3F8f6YnTOHfLHANEoFZyetjTohqEsiiZmGK+l+PnwXFJQotVJTYz34fdqHQ==
X-Received: by 2002:adf:eaca:: with SMTP id o10mr14025506wrn.401.1583657273603;
        Sun, 08 Mar 2020 00:47:53 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f091:: with SMTP id n17ls3752524wro.8.gmail; Sun, 08 Mar
 2020 00:47:53 -0800 (PST)
X-Received: by 2002:adf:f4c9:: with SMTP id h9mr14395121wrp.168.1583657272936;
        Sun, 08 Mar 2020 00:47:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583657272; cv=none;
        d=google.com; s=arc-20160816;
        b=siSB5LCN4zopFErwKEC8Cw0/6M++/gvQGdt2IZhNH7mBho+MdPVRCA/Uan3zbYzCHO
         ldLHLcB4LFt3pPKVTiK/pc5xIWA2uri9RnOwFCS64pxkEGqyXSiXxmkevZWa+UR0rj7c
         PuglSF6D//M+HE0qd0xWwey88RRCV8enMHkndmpbh6pEQDBYIPIsL/5eZ/MdPoUWa67C
         QVdxBJowG/OZrgzEqZcxC5vfVr9T6v68LPXLlv9qKQXlMTHzSMLdhs0zgnx6WXW7HM8j
         jCguRep+Qf/n7ouSqmLFog640EWvmITxyQI93p5P5xeyVn+cTyrb06IZMeOrGg5amyFi
         G3jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=yhZptLXbtdMUmbDk/FRL8L/JB4OCkCwA0U9GhgdJoEc=;
        b=bs0SDruwTx2nFoJNSq/TEmKBLGJxJRrz5c9FTVU+KmU3FAddtWmLkm99PwGMiMOqju
         Y26ZZhik9gKg2AcRXSj3egmL1PxihCRvrB/R4wnTnt9fYb139yqdL3ZkCd1vBF7tUJdc
         v/90fcrUHeu0a0azI0VI9p/H45LT8RwGf7jzQI8S+Mpdorrbl6CFJEXtEfXgIbukrAhu
         +x377YgxC9zli0cjkmZA/LojxMGMUD2YeYs/MJAp+73x1lAprT87AVfOWAX1SabZx2gO
         wAZvnSQZ97UYPSmE8p4/f3AOQdYpeMIMaSgSS4g5OZ9bXI9fkZXLeek7uxPBVILF2VMH
         ImUg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=pZyd0y8I;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id d16si331578wrv.4.2020.03.08.00.47.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2020 00:47:52 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M2IuS-1jRIaa1MlI-00s8xT; Sun, 08
 Mar 2020 09:47:52 +0100
Subject: Re: [PATCH] configs: arm64: espressobin: tune comment
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
References: <20200307233330.520833-1-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <c55923ec-b4e6-7a16-38ef-0fc638ffae2f@web.de>
Date: Sun, 8 Mar 2020 09:47:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200307233330.520833-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:TvkRCBZhezkDfWsegZBF8dFXj09jMQQbzjH/P9V0DNlSQnTHdhi
 TNtr9PJJ67ZHpUXCKfM5zLvdxf8ENy3Kj3hbcORX1tEPbVAJJK7MGorQx62UUZlBFpT4iK/
 ggMuJNifAcgI6+V9zD7XIVb7U2f2qoso7mL2qV71oYGvSiu39vnG/WWulE4xiuyoCLuMt1U
 CUFVK0hWXBeqb3r7g7OHQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:INRHK9UxhhQ=:K/nahDj9IFdTtYbZpBsZp0
 18SIe80ulz2FkfEAOY9IUIFzad///P0UeW8ZHlBzMYxg16zH9hNbL4imSlu3xO110GnU0AVgl
 F30Vq/mCT5vqdxW5UrIzz+2wSyzE/NVTaiRbMYyvB9wlfXvf45x61LXSURFn0LUcKWTtd+8VS
 I0PuqgW9qO9gHSOtpvOeV+Vb7nXHl/KgIbX9Ni5cPh1HBHDYRMw4QJo8d7vNioqWffsLmePD0
 wgNhfm+V+KTGz2QUVRaEHgZFsAslF75wEy86zboY8ghZagv5ptgl5OQKhA7vCDRO+83Aagtzk
 5QnWQtkEhpVg0/IlYvB9YRWgcseo40ZkGZYDVCr23m/n62kkpdojch9LSRZbaythIcMUONNvp
 7taP/9eLfQvpBHmcqhh2CSMfq3p1z/m1mKVvm+TON38Q/d7l/Ndyu8d3V9aVhzfebsM3gSCTq
 BnWn+7nC/Y2OuwfyPSGxjKE2IIiOxcj7qaHMz2Rt5NPBJVyhIKC0y8COCETAwvfySVLpz3ZrH
 rQKmydc3vEqI9c12LGR1lsTt+hOMOyPAidYYvinVVqxpHSaw1OBTxkeAkqCxoJ5Ma0KekUhIp
 5HXEpJW1oZkUeRuamMf/az+Xk/AyYJlzqYBVxZFcAwaIWuOb7G3eAHWtWzRYo/s6fZ/BWreDe
 tbL1RCjFkecyBejiePXK3HliRKqDki6D2uwuAiMED+oWwOgYnyN6gKExVhI6qOjHKaej9NGdU
 0i9/PzGO+oNC40blmdpu5j4U8CQF9JYKPRcHsF+BLh8RPS1DyXI1HGK2spAjPc9QSoyupBKpD
 FdDXc0GGYmHbyvkiA3slMKwpqO08obhHH82+G9mdRSkQEfAVUvNjD97eszMeq8v/R5NCH+Luk
 1UB2bVufZNr6C/DmMmmT1mZqNDZaVAFKlYhN4TiEOtEKomtnEvpOCYbKPqA816EgQYsrfj37t
 nUVOZAhyO8AHw1Ifs1OmxxQqz01dZbvW22RvrE3I3L4Z67QIwDoYHq4GU+Spi+coU6/3J8MQN
 m1yczTfHzqjpjXs1rZuVC2sWZ50baynemT3WLn241aqiQTyw3fMtGrxKycap6tWUEAIOwkPrA
 uPYSCussEvAFbYlMjCMI2XKS1PyBUg0gvm5kiilGPsR+nRPuAS18zkxhTOfD+xZEnh+c4n1Ic
 b6atC2J70AZthFjZ7/fO+KFklPkQDd+ChvQSyWIcNdBluEsKuVxjWuxTDeWnCcP7/8KJXqzV7
 912u5rTxXqFkFrfXl
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=pZyd0y8I;       spf=pass
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

On 08.03.20 00:33, Ralf Ramsauer wrote:
> This is probably a c&p artefact from macchiatobin.c: Memory on the espressobin,
> 1G variant, ranges from 0x0 - 0x40000000, and reservation can be done via
> cmdline. Adjust the comment.
>

I think the ZyncMP was first. Anyway, applied.

Thanks,
Jan

> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>   configs/arm64/espressobin.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/configs/arm64/espressobin.c b/configs/arm64/espressobin.c
> index 79d79fa2..1b75f6d7 100644
> --- a/configs/arm64/espressobin.c
> +++ b/configs/arm64/espressobin.c
> @@ -11,7 +11,7 @@
>    * This work is licensed under the terms of the GNU GPL, version 2.  See
>    * the COPYING file in the top-level directory.
>    *
> - * Reservation via device tree: 0x800000000..0x83fffffff
> + * Reservation 0x30000000..0x3fffffff via cmdline: mem=768M
>    */
>
>   #include <jailhouse/types.h>
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c55923ec-b4e6-7a16-38ef-0fc638ffae2f%40web.de.
