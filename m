Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBDFIXH3QKGQE6XWEH5I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id A58752025F9
	for <lists+jailhouse-dev@lfdr.de>; Sat, 20 Jun 2020 20:23:09 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id z4sf1683578ljz.18
        for <lists+jailhouse-dev@lfdr.de>; Sat, 20 Jun 2020 11:23:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1592677389; cv=pass;
        d=google.com; s=arc-20160816;
        b=IKT6iAFiyuW0/iRMF2vQ5+46LkBajqVKRpiWqHpI6E4lXsg29uqTZ7WetIexjxKk6Q
         F1ttjJUtUgYXkkVJo0174LmRIcgNrq24gA9faj7ibRwjc4N4hmoEDJkCb8ja+uNFRy4F
         KYigyxcCxtdRhFhhondKk2fjUjlMfNtyKV2AnVRPuMF5GtkC+DV/P13r+2JsAk5dK9ap
         RdySAkCFIbB80ywwTjx0inX3Aud+XwnI/IN0bwmZ8PFKeNSk57l1ReIX8ef5YW0wqEBQ
         Me6+7UXMK9WwUDiOLJJ+xgubLcw9rAdDhZ4hqXra5MLuSiUUftpHNgVu4WyOkHfLpZk2
         Tr7g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=mPTMPWPqeOBAGXs78j5ew3evvSfSWik4GS/OUWAQbKQ=;
        b=a8FI7gi6dqFiV5Vs8jY7xt7qeKM6032GhygKsEM6pw4Ntb3+i6pKQCQE6lx4pVo1Oz
         KXY8iYUSeKind3M/sw5SIbnP0YcNUPJNSyRfH/yHNE42i8/b8pXjWI+HZM9toWGnNI6q
         BWUidmZ8ijZdG5PnQynhahNoG0BNY6raBnicRQCcnWeS8hb0TsJOH1+KBb4bdVKQf0nS
         gnjgSA06KvuEH2yW+52n7mPdSA/J4akVzj86lnfRDEWjoFOjnx1axA81ow5OL3iMYz+g
         UYH+HB4U08lU9RRJY1oeqzCPRiaIKmLwxllCMWoFQlDFIhpbTzReGpCB+wiaXljXtzpa
         jQ1A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="jmRSwR/Z";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mPTMPWPqeOBAGXs78j5ew3evvSfSWik4GS/OUWAQbKQ=;
        b=ql/ol28cfoVrhZlGax+vf3SbSvNT2XjesO7PVpNuCzVgn6HYQnWdkYAyUAg3/M8dRx
         MP5pEsfX+AsrCu8ynnV8D/HIJxeQ5Tp4jdz9cHYl+1bk4/ZNeCz+bBFUyWMeKKfldEAq
         g6+gHLsL1ouD1kx0/uqJ8jTcqz2HdtOYXZzCOEDgIFGiFjNCOiXF4Y8zpGcOSbXP0joZ
         H1yhSJVCH77MLMLjim8KatRz11eTNuSOfC+sOkaekqrq5ArHJ1CzJ6pIl98Cz701qEOI
         BsaynnGeTGk1b74jBGfEdyvOE2Turh79mlklASztUQKcZBqzBHZ9QU2TDb+vALmZMhyG
         SBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mPTMPWPqeOBAGXs78j5ew3evvSfSWik4GS/OUWAQbKQ=;
        b=sD52awUdUobCsd5Aa3YBbV2Id7Rddu+74vwR2wNIQHmI7c9Kg6R/RLPVhuvYyP/EJI
         3UrNyxudoK9XhQEQ4Tf+qiyxyEHET1HWYaJlzyyOZrRLWu1fmS+LZpowNCn3UCV1G+oZ
         E6umApdGj5PqoDWvXoXDJIV/RxcQlwnOknJARxenc/WruXKTJYy7o3Uzy/9fJm0W7baJ
         aYemByeXAG3BzR0vlcOD8uWpI1FqZG8njuuowCjeUxz4epGd1u3xMpKmmSmsJBplqC/R
         uZOVk6VQWzeZsh+FBC8OD42+euvh+FmllyC7HI51dcdPf1S5SSmQKMkYRl20ZevpOTl3
         NEXg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530zPfwQok8x/81njr3wPRs8RvWXWcbcf+JsFgomDo2nIJMidN/9
	TqcQXWG76XzHrfTBHzsJ4T0=
X-Google-Smtp-Source: ABdhPJwE8WdbGMKanWBTO4nFaqSvSuWsdfebDxZ6M2lkTHaM+TnLZdQMjw+rAxkUeRxOL0NicZae4A==
X-Received: by 2002:a2e:8953:: with SMTP id b19mr4907032ljk.187.1592677389161;
        Sat, 20 Jun 2020 11:23:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9718:: with SMTP id r24ls2537269lji.3.gmail; Sat, 20 Jun
 2020 11:23:08 -0700 (PDT)
X-Received: by 2002:a2e:7011:: with SMTP id l17mr5013924ljc.424.1592677388262;
        Sat, 20 Jun 2020 11:23:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592677388; cv=none;
        d=google.com; s=arc-20160816;
        b=z/NTxBGQs/Q9cOummJMh9KofX7vxXTcl352V9Lfe9wby+jHiBtiRKs1z5heelZMhAA
         04ulSH16gRYTCiQRw7RnF79GuPda0cSRJ74vKSJQTrxQrBF6nwtVaX9cm+US4GxLEdH4
         EA4gr5V87wgweBccZJSSw1nx2sHfgiAzTVJSJFUHJK3yCi/3LZxmYBBUBArx2ynTAXbm
         gh3zLfy8p4nmH0OmP4YtNp/tM14WFeLqPHXNoAyKZyADorMY2KUEbxuVuBY6ZY9OzY9L
         m/bI2el2Idu+j5mLNhfBU3sljY9hvwDrt3ng2c0VKkqnuWns3pmRjPkFtkWMY1oc0BX5
         G/QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=EcIzFmGd1DfYT8zpUdhivyMoy3CdSv7rYcQdZGrfTe4=;
        b=P2dYMO3RkDK1mYD9381KbMIXySW4mnEb0a6F39YGCYK9eI+lccEe7YX9PB9fmNkc3C
         9rn0wB3UAlWQqiZAeDB2CQVvk3X1e1j3xgu58UmKPwJI8fCqjgWbSjhzVi5H/j7gvJgP
         8/FvMCDSq8Pn9qoMoW1AtQSyl9fahDET4nhqCU8h6UXci96QzMhjDxZI5Ac6TTF36c4D
         lVcvdbpUZyWryf80/kMhwqtYGEvpFlMAUpr6LHibhNQpzytkTftLkmUswz9BqodL6XC9
         2oru3gKOtX5Escrf/AdV/7j1XjWBXpb0z7r+SMdbpP3zVLG/ckioSbXQdCANkoW/nSWo
         Q9sw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="jmRSwR/Z";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id i17si667388ljj.5.2020.06.20.11.23.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 11:23:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.53.180]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MQPdr-1jZhbX31E1-00ML8X; Sat, 20
 Jun 2020 20:23:06 +0200
Subject: Re: FATAL: Invalid PCI MMCONFIG write (Apollo Lake SoC)
To: "contact....@gmail.com" <contact.thorsten@gmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <0312b771-9d95-463d-a72b-574d191ad68f@googlegroups.com>
 <f89c9646-78b2-b256-5a55-e8c727a28740@siemens.com>
 <02ac45a1-eb95-4ca1-b455-94dcc50633b5@googlegroups.com>
 <ce206155-7c77-54fc-af9e-d0ccb98e0765@siemens.com>
 <8c449002-89f8-48bc-af3f-97b3221bbf6b@googlegroups.com>
 <ed7359f6-00f7-4b22-a220-f7bd2ef38150n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <f3c8c0af-7d60-e7ab-400f-8ef6301baaed@web.de>
Date: Sat, 20 Jun 2020 20:23:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <ed7359f6-00f7-4b22-a220-f7bd2ef38150n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NxR5A/cPd4hvnUjcO2tl9Zsl7STSLl4i+FCaR4YMI9XInrhZdwq
 pKRbrgOFnyGrHR+qW3q8UjD48x3C3DBvNcQfGkQfpDoTR3hPoSy0GwjVIVmM7QKtzFua/Ic
 uX6KoVig8bjznWmcoWXFmuB2nAhZ4QjuvInYBpwMw7oaPsUfVjnOm2KSoRnQ01J5QpYY9k8
 BNkhO+mbYtjpiQ5x0R0HA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1QI9HCekCuM=:+0HgZgDImUf4akWTB2hQOR
 axBHmNpuxdmlL047mDI4B87yKRtTmNPy1454lBbeyx9f+q1tjN3jAutGzDcrDTfcFqjn9qWm4
 MSgS1qAwl6DiX0i2MzXGqeG9SeDsulohA3noS/uzwZwl6lODr+r7/K12yompTWK5qBskDO/kO
 HnDkzvEgH07uoPWrnlmJUrXpsC+ucZ7vO1U4waPBGHDIjg53UdEKmLI9E6s92oOezELjrh7Fc
 Ktx5W/GdouAC6miZJHF0kBZ93jJGq2JvNt0HoiftCMMD6czVcAhcIC/upn2AdWIXvTu7UI5ye
 SbTg/sYQJJws3Uww3RBhK/ir9TJ5WL7ZiLfCRL76TtdSsk4ztesrgqKxNXy6iNfRo1khXWOTF
 qGZp7KfWWyrRo1jQ2DR8EZK9y+KktI346JnPRhRkGcu6wpmhpGThqj0RSeRvAUet47+vKrA3C
 tdiVb4j5QZFK8TpsV1tgkKWYAeCVUvfwgAVvZ79Ml7hHs1FyPBdwoCGrPY0hp+LMcEmSTnZYW
 L1OjIlHTQLejQMXp/BBuVvQ67teS2hqVadGPoWThXi7uFCqFtRdQI0fehkrzVeOacnTPdvmpX
 18nx9ob6ajJlZFiHVI3Edy+FM9fqKY1z+Wi0dUnvifRgXxjpgaV/a7CR/0ZRv6EpXhpWAR4VE
 cgAaLr/zpQyIuWikHhObhSa+wwPBiS3vUDUk7eAagRkWu6YopCgbrdY/Ptls/GdyRti6OKBaO
 oDCbTwWpXusFKELpduAHP9dpnjtN+fjLSGu48KX8/NptAw/Imtv6XysPtXzG4N+1kMGPlNb9Y
 EVLdBN4McJwFP5CT4KWCQuMnkj6nr2Lh04EwdY2pZ+MUQOMDNCwjvigTFyXjlfHGuj3f7einP
 y4PNC40uT8BrkBbGhN+Ay8yWz8pcCyMtxr2Sr8NI79RfdmspcJ6DI/M71jBaqQaoFh0y6K+pJ
 PNxMrqvylT5J9hNRideEZ1xlNA3Qan8V9ymjmB0wBcpbWS5W1IQANSvoIFwI3khp5SZzf+B1K
 xkkMQojgKtvi7j+HQwKaotVsS6tUgKOYEEN9i16rAWXwwC8F7lgFFB5EZXFB0GOTu+XNk6DTf
 8fl8KJAtyYVhaTECnCBAu0sbOW7FL8suovUVoZAKJnclfnkOcHTiK3jTP3DbN5Z+8ffdTPSlq
 4V6e8dV3cCmM0Mw/A+HjkzGeQSQnl6K5ugW2Cb1VnXptPWcVViOxDzmtjcNv9fxwglxto=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="jmRSwR/Z";       spf=pass
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

On 20.06.20 18:31, contact....@gmail.com wrote:
> sorry, for resurrecting this ancient thread,
>
> @Connor,
> if you are still reading this, how did you solve that last error? I ran
> into exactly the same error.
>
> I went through the config for hours up and down, trying to find
> something. I filtered out all the "Traps & Pitfalls =E2=80=93 x86 Edition=
", I hope.
> The odd thing is, there is no such PCI device 00:0d.0, neither in the
> config, nor in the pci-scan. So, where does this come from?

IIRC, that's a hidden PCI device on Apollo Lake. As such, it was missed
by the config generator (as it was not active at this point). You will
have to add it manually - or avoid the driver that unhides and tries to
use it. You may find out which driver is involved by setting
CONFIG_CRASH_CELL_ON_PANIC in include/jailhouse/config.h and analyze the
backtrace Linux will through on access violation.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/f3c8c0af-7d60-e7ab-400f-8ef6301baaed%40web.de.
