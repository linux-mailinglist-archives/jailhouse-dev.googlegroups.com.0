Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB4H7SPUAKGQEJLDGS4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C1C4706C
	for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Jun 2019 16:25:52 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id d15sf187288wrx.5
        for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Jun 2019 07:25:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560608752; cv=pass;
        d=google.com; s=arc-20160816;
        b=uoSz3N8vDcEt9xKOR0rY9lGIm/5TTc93x3H7TcCVh1gYAD6SZsTNHhRdU4sTk6545f
         O7Nuhc1Jb1S9rwnUKq8L9N1NK35D/9YVuVI++A3wyAZHQ3MxeaOAVxrjyV00Ci3wZcuP
         /Ki0ijKI0e3INyCNMgMAR4GBIpNSo8/VpKCfW6qE4MOJn33AqFvb1Bw3DvKpogOD/Qbs
         HQtku1wDaZuTbjRd+1dLpGaMJdgTkYMlC66oZ1/co4CD56QAqN/ejZVLPAqhNIrQ3FOZ
         2V6vvU5w2Gss1AavJn9XgM8AXEfVPj8h2JmQG+UkBjZZYqOwt91LSOjs2k7dRHaqpitX
         crLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=tkCjKQnHQQZXUkhZkVm7J/pBzOjF5EmiBm9VpKc7JQQ=;
        b=UXqKmaf0jqVVFySGTag7d6nGXWQYvBIa6rVKh16JGZSkWFOHbP7m4Dp+9l8tR5AN6F
         Yz3/loaH3O+MoD6jUh5WqsYjwUOWPQYKxIvEO1rrbE07u8fjri0YcunKQoY1XmLyODAb
         4fXMyBeUiWeXOMDs/ehWKUm5ffwkGB6a6TowTixGQCPgZn9kkb7xCu1SnKV10raPTrJV
         vFCeYAzFTLRehl/kjU5U3R5AUQiuNdBiLqAR9f7pWBBdvuem8yiRNPmsI58aP1z7v7Cn
         YrkTRpsBXz5I7CJpaY2IdHAdawv4CkemRQBdxbxjWtMXykei/t6kSuomnY4xmgwfli4M
         SwRA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=a2cIEd7z;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=tkCjKQnHQQZXUkhZkVm7J/pBzOjF5EmiBm9VpKc7JQQ=;
        b=a6WuhlSiLQ2X/ymajNXLvuetaBCgAUOGjYEDUKo2qvYPp3jT3IIBZAu2m8Y8dlp70C
         1Qm95PVCtbqDVAjjQLbRi8USt5pQUGQjazc8xZ8q/izQSd+mBJPZbOVQ2doRvVxKg88q
         FPEnjzfBD8vP++yduTDJu68xKx9zdJ8VH6UzkD+xDymQJt/D0gVIXt2xiM3JhFGFVAXG
         xUFHfr/mXZ3wGgZnzURCM8GitlPdTediX/vZUKyta4Xx8oHKN1iO4cxlggi0bCDEJeEB
         tBPVwUdrTd4Mp7ZwD2LPU6DdB71+aVFBcOAbjc3u2F+E4laxswJlVHdwMgEATUJPyUvM
         xiww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=tkCjKQnHQQZXUkhZkVm7J/pBzOjF5EmiBm9VpKc7JQQ=;
        b=rqKR9nH7WNP2BFo7RYqqZU73rhFb6dmk37MesIf4dFuAhEAhZuGfwQPjsTbJ16GBMk
         8jYSH5iVuYM6VFj5ZGc6S7DfRJWC1sSxxmjZTJz1Lmn9k572l10O3JHq69e4FnL/u7s6
         IbzxgipqDEl5Ir0a1w52vy4GUiiBLzwxI8CEqIPr/EABTRzxU8reYFrLP7iFgyHCia7Z
         G6dFKUrUkZJwlGiXX8BkP5ljYviW3YCOnaB+22n3fIVS2PeOYRBirTu8lNymHJD/wQtV
         8h1LelJubmUBHwwd8cRybdahn/ILCo4K9lGR7fSwsYbwjIH2zD2x5Qj55L3GTMC6VnYY
         ZfPA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXk/jnwsiZiIsOS0PKFUrz/h4BaM4dQaAkT0Fchft5h9fx1LG3j
	xmft8wZXYDQ4ZolUluhN0ks=
X-Google-Smtp-Source: APXvYqz0jVc9uDGW4wtQtfc5a3UYO3lxMU698llX2Sie82WOBBKYullU4dvXLKpLuJn6160hLx0aFg==
X-Received: by 2002:a5d:52c8:: with SMTP id r8mr308658wrv.250.1560608752281;
        Sat, 15 Jun 2019 07:25:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:ab4d:: with SMTP id r13ls1636563wrc.5.gmail; Sat, 15 Jun
 2019 07:25:51 -0700 (PDT)
X-Received: by 2002:a5d:5386:: with SMTP id d6mr15904345wrv.207.1560608751807;
        Sat, 15 Jun 2019 07:25:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560608751; cv=none;
        d=google.com; s=arc-20160816;
        b=ZCp190WgZ6oQo1nrRAH2yGAbgC3hYrXiU1l70x0CiqctGXCT4AcJllkyZiMED1ragC
         9sQaPzArn7MO6q5ihYuuPBBP3I+X5jRnh2JYjTczbVilNw431HT3dIZdBRM3y7XtCQKn
         3s2uyQHtf2lPWp6Stwt8PMP92vgJencCHjwYGVauk9/aX7vksfMgPlEuJJ8v0KugWXZU
         ALuZWac7K83yJqkFL8+pkv+vrCS27eGDspdGzNlT68s0fCgvSJquun/leJ4crl3W4jwq
         5cx9uSQy8D51hHeaC9ZemE5FwTaon0P4rGKp/Pfx4Lgr9EVkuzYm4bGhG9NqvVCUZHNC
         zdbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=BP1d1KTk6mnsNeXpXzyp7/rzEsDDQmMZ7KseIdtqSuc=;
        b=XI7tYJSTC/LBaY5g5TQNyJeFZEplbnQH58RPnMdCnPm11ChQDvELqBbmu/e2wu0M0R
         knZGE0r2qlfhdizjtezkrDPiQqTmpUePs+N7vgRmMtV+M7WhIqa5OXkuFge/SEwS1nws
         xM7zoD70PLegsHicPEhqsnq4+f+k1ZNi8sy5hnJY3LfG5HEj1QpvBpEAk2QI9jsEJBaA
         4fIy8A+IMko7I2teDOCN6XHlMI5rUCsIQOf6KuC69epdQnsEtkPK87Vao3300OaZ++hP
         xxiullI9hE8CJYYFu86YjFvHVVPNq8mGjHdQdnFxaezlyvy9TpNPKluRltYDDYOA7nPX
         3Omw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=a2cIEd7z;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id q14si243155wmc.1.2019.06.15.07.25.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Jun 2019 07:25:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LshSX-1idyRa19Jp-012JKA; Sat, 15
 Jun 2019 16:25:51 +0200
Subject: Re: [PATCH] scripts: fix comment
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
References: <20190614184926.10964-1-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <03d9fa38-b539-c8d0-4bba-278c2fffd1f0@web.de>
Date: Sat, 15 Jun 2019 16:25:50 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190614184926.10964-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:WQ4QRSh3aOWBge/PHWTS8G1SKZ8+70QQaT4X0r061XIaJc3koNh
 dRtLY6InWOfwpU+V39r9dtmQ70fMB6k8/uO8Fmcj22B1OqiMPOo+D+KJ4hJPBNd8w0u/ZEb
 7Lmaz0CooLrQbHL0wjra6dOFK+i1NHHtEYRzksDJH1QkzN7Zb4SDTFF9vPPdiNxvG4DP03P
 aWwQqZxUuOgPt+YpjAgBg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+sF8V+Tp/Jo=:xUOywjOnDI4v1v6WV/aSrg
 qo4tsTVyJJ5EmosFD1vWzvP/sayEnsESdE1YD7bU/p6w4o1cWaCVzok17cYS5uO16jgtJ9EQn
 b0j9Qdahez578lgkY4fW2OS2oH5Edb1GyoFP2BC/rTagkoyob65HWJU1k5dznDsFOcSaPoxUW
 TtfDeV8Y911EcTJ24ajdwv7l3cv5A0Q4LTdN6sT6EUnY4n5760OUDoaQlOSxb5ik0ozjL3f0e
 zGElvDl55/k0Eoy+cF8BbQM7XX2i+rMS1YS3zow16ddJOsCZJj8Ygwlo5aWYkQPWL9g5VrXCz
 nyYzRXY3KUY4IZB2a09KWKz3AbIhUwTKVk7EH6234CCK2uujlFfrOsPl70BIgPKfwEAXJJ5L7
 Zy7+MU7VrHd4bsewfLIU0GCUHqY2o4I7RIXFMg90DojgNDYWaKqJmEFvodWUUgT3sjl3BGEHg
 kF3+pqolO7PvT+a/5iEft3W9HrpRI4LtBMludGmKhilB2Xc35feRpEPHHpFuOh6dAiKmd2Vqd
 Q2Lzfee6rLELcXPcvXbVoxdG2cfJS+dHvR7WC0DinGS+91XRQ2YHtot/LDtH3yFn7msdY25VG
 IQqd63ywqHI4xW0gxjj1uunNEF1Us5Cr4yIQOAEd7ANGvJEjESv94BjJ5K1CKTzmouC2dxl7y
 YphAruHEOzERXR7ndcNI0HyvL3Jh2yuLrpkq4RGn4Dy7BskB60+hntJ/Mls66cBqCPSoKk56+
 cQiC8Oo/ZPhCmaPw4JtIZFbnccg2xl3tK5n/eHlxzFcM8oX5mBPPGNXcsx6CAw64t0D+0bjet
 BZLWeVyCnMKdk4xuNQBSK4oik4cYe3SRlWjIAv1X72uOuAs/S3+4NArl8gzUaPPoo47IdSYx1
 v9gbxWsuiPd2+0j/kldtz7krccxdvQwVqpZ1gNPaa/v9ugN/yue1w3MM1mkWqmK65NeonwfKy
 S3UhqQq5w7TgCh+btMBDexDxIvXFMmH1BU4ta5Ohh0fR4gpZLpzAg
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=a2cIEd7z;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
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

On 14.06.19 20:49, Ralf Ramsauer wrote:
> The file was moved during integration. Align the comment.
>
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>   scripts/gen_pci_defs.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/gen_pci_defs.sh b/scripts/gen_pci_defs.sh
> index 40fb3a72..480f7fbb 100755
> --- a/scripts/gen_pci_defs.sh
> +++ b/scripts/gen_pci_defs.sh
> @@ -26,7 +26,7 @@ PCI_EXT_CAP_IDS=$(find_defines $CELL_CONFIG_H PCI_EXT_CAP_ID_)
>
>   cat <<END
>   # This file is autogenerated. If you need to change it, edit
> -# tools/gen_pci_cap_ids.py.sh instead.
> +# scripts/gen_pci_defs.sh instead.
>
>   from .extendedenum import ExtendedEnum
>
>

Thanks, applied.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/03d9fa38-b539-c8d0-4bba-278c2fffd1f0%40web.de.
For more options, visit https://groups.google.com/d/optout.
