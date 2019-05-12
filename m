Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB2FA37TAKGQE37PGLWQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A19C1AB1F
	for <lists+jailhouse-dev@lfdr.de>; Sun, 12 May 2019 09:51:04 +0200 (CEST)
Received: by mail-ed1-x540.google.com with SMTP id r48sf12102713eda.11
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 May 2019 00:51:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557647464; cv=pass;
        d=google.com; s=arc-20160816;
        b=p2uysO46nPgckjGLQISEBKUoMPdblQ0r4afV7eQQJFPTEY0TdjTR0BamNUf0CGzPua
         rUy6AOdewR4jZs4s5nHmYd3rtTAhxGt+nIYMCFbsskCuwqYfTcoseOqijVezQepHtZwx
         Agn3XQP+A6lNjGr0EHAWNdIvQ0DJiICalgnngAAanXzCNA1wKHH24ZlLps4MOrrImcUS
         kg9mYwR0zUYLAhaLg9Pw44y0Wyvl5pCkZYPT3p7iQ6i+IlzDMX6eNuSE/0SNcPZWcH8Q
         I5UswSamaKklP++3/55EG8tEppHn5rp0hUimj1BYmgKhq4nBWeB/k6f6P+XqSKyLD8Uw
         LSgw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=YFLjCUdJGUW9OKn991CBdEjGsUgnLTvljxP5BngP5Ts=;
        b=hg6BBEdi2WKi3ciIjJipaI0jSwDQ6XQgyKkPuXHOz9D+okMbjKIKP3JFREZZRpWRiH
         y6M35t/7w2TVVpSYKCJlUVoUsPrILlX5SGTLlL0XCOZB6WKfvY0YC6CYNIg5RNG/mEBp
         mdd3xnm6818ab2wKJ1WSXDIzz2yWUgbuj68/hABNCGlQW8bfUIiwbLaKSP56pUSOXOEZ
         FOZuPno+bVU/yYSIqXoBC+vBh/p+N2Nev+7b60kyZKnsWkjY8YEHQWERx8ORH4ZKCCWY
         LLM2X9q+sKW+MJsaUpHWd3ESVXZPdyesy0xExK4/ZPscW/RGwV/e8ndrUNKTQZoOlJh7
         7F1A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=HQL8+X4t;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YFLjCUdJGUW9OKn991CBdEjGsUgnLTvljxP5BngP5Ts=;
        b=gtfpdvin3rqsOhXJ5uv5lLJ8HJ1ym0GYXtU1Ep6AHLPFSRZ+Brq2vyKARrJPqtY2iz
         WpA1BO+FSesC5AerErE3FM3XUBaw5CfibfrJly1o9dvd97H3yvq0leA9W9xOBJ+s2h0a
         Cc2SaAvCAX+LENfLRfp7qVsizUlnmSObvwAcsEoCPTBch9GzIcV0ybf9orWL0aRwr74h
         OajWV++joXh/F7fakwrXkUnW8r5HspF+UD72O5mkYvfJ8twb1sOUvXvusP7EMYs4KGZD
         Bcr9q8ZZnTaKllQcsM2T/PLiAc49Eh5ZpBvKF5p/GjNcjttG9e5UNwTC0lOjM/DoAYdl
         yLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YFLjCUdJGUW9OKn991CBdEjGsUgnLTvljxP5BngP5Ts=;
        b=melML8Oxt2GVGdtd3tDmYiwfsIvy6mNpcYlp755X5mWA2H7H6AMFVRVex5Xc3Jhjc3
         0SkaOiTQzjrcrNp9z8C9GjTv/BOHkiieHPhqn97qqbw7FMbJyHjRZYKX4T2LWZ+AehKL
         Ut189RpYU+3vcNXBGrFO9GWYN3DIbucNr1hbkR1TPkYCBG7bFT7WBgZF//dY9UlWEDWc
         lBHsmYa9wXTMhr9SZ/a0lbPwnAC4tcaRzDjiwX6iL223tfMN3y+kOmHdA9MISMagX86T
         yQhD1ZV0tY1+zb3+8mA/0ljfkmN3UTj/eCLhaU7dDZ97fcQwn6pkrhXa63eR7pPYC4Zu
         wzVQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVzwO9Buok3RSyTg1H933F9kf5Iyivt7Yb8/fvpMh6YzQDxKDku
	oDIAae8Nw8TqmJwNEvJbbHM=
X-Google-Smtp-Source: APXvYqzNYmLgYvOOKNBBJkrncrUvpl6fLC0UuckFx1nCW+8VVJG0fRGbaCgXj8jAhC6/7Yc2nz6eBA==
X-Received: by 2002:a17:906:3b8f:: with SMTP id u15mr2254077ejf.6.1557647464330;
        Sun, 12 May 2019 00:51:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:1f51:: with SMTP id d17ls2333937ejk.11.gmail; Sun,
 12 May 2019 00:51:03 -0700 (PDT)
X-Received: by 2002:a17:906:43c2:: with SMTP id j2mr16851843ejn.136.1557647463884;
        Sun, 12 May 2019 00:51:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557647463; cv=none;
        d=google.com; s=arc-20160816;
        b=p4SLV2Gj0KlJCqI35zTieW5Zw5NVbY9PZpPuYF8jL4ToFc5iPYp8jzXFUGL3ZEIo1Y
         450g5k7Q/Dex5iyyWtxwl2/lSs+dvG6hWkz25AfE+FW/zbHkTNfdl1AjVEmq00WYytd2
         rjOt369jAhN0R/Io+oLiZqCQwQETr4WW9vLkMMdwBXhOgYBL9GhuCfcIpjuPMXGpAt0Z
         mM1iQrV1WtUdgfTRMy4iGdT+4xbzbfoSg6wpJ9/1ogvksj/sDpJcdJVlwPPE1+mPKAkA
         CljiPz0JNPCd07rcWnOK7fT1Ry1C2XgGuA1meAVzo/JFPLGiO2zHlFiKpjI515inBgKF
         IzAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=0H8uQn/FHdlGL8fzf/1wywnh+6sEN3qSSZ4gGzO7E+4=;
        b=DXs6ZZSqiW369ow+e7ILFlj9P0IwsxoxBw8Mtknr7m/LeczFS7exbesCvn+LaxAPmL
         Ilhp5LUDjEtfLA94uV18HeiFaFMb201Fa3LRNNdT9x9E/AdT5AZPG0g9RTg1kLu4ghNR
         aLOhnhMafFfOmRVjmlQipMrXTtNurGVowhjW7YX3jwYQpbquOShS1NZLFDLaS+vJtJRZ
         Ghaeg6BrTWCiBwwItIOZlHelNxFiRDeZ6UGrLTSFL/DncwKt59uKJf9n29zbZTSSryDe
         P0fDQkBCIw9ytz5ShCnkBUOyuUjYc8EbnTMbNQ6wuaEe8BMgjSeC0/dG2QF9FqFYIEsd
         XM3A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=HQL8+X4t;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id k38si3171186edd.2.2019.05.12.00.51.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 May 2019 00:51:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MUWCB-1hG4aj3vyF-00RKGC; Sun, 12
 May 2019 09:51:03 +0200
Subject: Re: Unsupported DMAR Device Scope Structure
To: jeanne.romefort@gmail.com, Jailhouse <jailhouse-dev@googlegroups.com>
References: <edd9ef72-beae-42c3-94c7-ac5bf29ba57d@googlegroups.com>
 <594f54f4-eb5c-5b64-2d49-38997bcf2f8b@siemens.com>
 <50b964d8-41e5-49af-96dc-3080cbd3966e@googlegroups.com>
 <62d847c0-b4b6-4395-b603-ecf2f87095d7@googlegroups.com>
 <3bcebf94-23a5-18d3-1f0b-bb25717167a3@siemens.com>
 <c238d436-5995-4c44-8a19-bc26654671d5@googlegroups.com>
 <5c94104f-c27d-9074-1990-61fa9e9d05c1@siemens.com>
 <cda9daa8-fbe8-46fb-aaba-75ebd38e141e@googlegroups.com>
 <71f64f49-1bcd-4ab0-947a-0bcabc2ac1e6@googlegroups.com>
 <02568569-7d1b-4bb5-8a1e-a5cbee5a77ee@googlegroups.com>
 <b68c813d-2949-4516-bfa3-2fb4828cee9e@googlegroups.com>
 <63282997-5d5a-4c59-9d60-1d73fcfe49db@googlegroups.com>
 <0f2b55b7-09ea-4158-913b-4ec20c7443d9@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <8667152c-c459-997e-42d7-0f908418be0e@web.de>
Date: Sun, 12 May 2019 09:51:02 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <0f2b55b7-09ea-4158-913b-4ec20c7443d9@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kw0Ou6TCXQHIVHxOMUyTk7Cob9iKD40QyRq7Fv6Ut7oWzmUSeQV
 e4YGvzF7WxYeUSP5Kvbv4+OqiWZdi4hAVAf/qIDYJn1d9fBvTu/I+3OzrIaHfJqLjSX69jC
 m0aoxPaUWV9+21sT7dxEPUbBxVAIImQ6McfwSqvGcZgUn/HBoBfi1stmosD7TRzEAoFL3G2
 x0s6vPSxFe6NNLhy4lG8g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:EJO79/AuuBs=:QWrmuE8EJhE+DLAMgs+3aN
 epaSurgdBtacreeEvQScId5y5DzJYgj2fz86rAG1zTqNlzO4snssUYgLdZQr/wLPkULAkrNBs
 5iNw3x7M3rBmj78qK0Y3pbVddP5oGlWMC54lA1u2bCFMfrnnF5m2Eu8/VWRJs7R7DPOoCOHDQ
 mgbCCz4hBI2KtTZT7R49jVjDaRxS7fW/uk1nj1xSXpE1EmWurT/rP/FTOLJKHjmsnuyOD23WC
 FVPmux/5w5fjId4nO5gmhaH+VBPH4atlp/TQtsQAqBHZbR7PIONG6Oxf+qZ+6BrGzuyOPzjVx
 s7au9QLU29AjZHvYBsn2p3tsczZVaiCKZnsl83xKPQOb69ZjOPhP5uHis2zB0QNn8MjFmftbq
 6Ed6DLIOletCmJTBfrgGYAHElmvCUKF5C5vMVY36ok/OLreAiBbYROnFXYeBrHCBgsxnvkL26
 yI9H+/1eE7sEy/W/UDw5W4O7JrI9n+H0jzZQPtt3QUnzGQOy4daRMWU+kx9WVFwOHLqhq2hk3
 FmzlyADo5OLoOwAQ4dgmLLz6tY/dDkP7EhGbArtYjOQ5nY13tBZYnfYeodc3zjd0hHS4n7br1
 PNpiFzzf2imsE68XZ4pZD2eRYkATOh7AHSXJy6gTfyTe49tOnom542wB0cEHE/mg4DSwbvuCD
 9G78oT1N0nrAwjJikuke+0HOL+oY63hL3DcrDVji7YSdRb8YVR0S5nmB6VKga2gZEEYGakEPs
 qoAqda7AD8tF8cWf2nlBR9KM5lLI0JlKavNmpkfQGQEaOjm8p4D0OBibFt+Dm8m0f/tcEUAaM
 SSpvLGW5L8/wnYMimu84Ipau9l4IHX4yEFDxbhw98VkPNz7pg0eUyyqVim14GYjEhUaSwoSaP
 aXgOVinY84O96sLBneFTgBBuW82pen539dHf361LgkGJzlnANAEi60tcsH9QxH/Nb9qEEA1hc
 ddyCtVrgkSQ==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=HQL8+X4t;       spf=pass
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

On 10.05.19 15:11, jeanne.romefort@gmail.com wrote:
> Hello everyone,
>
> I'm still trying to get my rootCell running. I have for the moment connec=
ted a serial port in order to have the logs in full (in ssh the communicati=
on was down before I could have the logs). After solving some minor errors =
(such as Invalid MMIO/RAM read or IO-port) I find myself with an error that=
 I can't explain:
>
>
> VT-d fault event reported by IOMMU 1:
>   Source Identifier (bus:dev.func): 03:00.0
>   Fault Reason: 0x22 Fault Info: 38000000000 Type 0
> VT-d fault event reported by IOMMU 1:
>   Source Identifier (bus:dev.func): 03:00.0
>   Fault Reason: 0x22 Fault Info: 3c000000000 Type 0
> VT-d fault event reported by IOMMU 1:
>   Source Identifier (bus:dev.func): 03:00.0
>   Fault Reason: 0x22 Fault Info: 39000000000 Type 0
> VT-d fault event reported by IOMMU 1:
>   Source Identifier (bus:dev.func): 03:00.0
>   Fault Reason: 0x22 Fault Info: 3b000000000 Type 0
>
>
> Is the new sysfs-parser.py the cause of my trouble or is there anything I=
 missed in the configuration ?

Could be. 0x22 means that the device is not present in the interrupt remapp=
ing
table of IOMMU that is responsible for that device. Try changing the .iommu
number for that device from 0 to 1 or the other way around. Or is there no =
entry
for 03:00.0 at all?

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/8667152c-c459-997e-42d7-0f908418be0e%40web.de.
For more options, visit https://groups.google.com/d/optout.
