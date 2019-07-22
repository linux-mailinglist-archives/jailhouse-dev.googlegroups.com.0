Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB7732XUQKGQE4Y6I7DQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDA36FBE9
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Jul 2019 11:12:31 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id y3sf25897745edm.21
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Jul 2019 02:12:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563786751; cv=pass;
        d=google.com; s=arc-20160816;
        b=hmPbiWoCAulPSnupDAGXDosDmYJLW+FKGeGMBPqKJmgN8KSL9oc2yNJsCcPsMKQ/co
         lDMjWr/LxB1C6lQMi0g+q7FuipPVqaGVPaO2mw3M5R6np6Zxl0KmOCv96SuWjrskqP0z
         UgMxxJ7NR+co8BDQerEa1tqOzmmsb03qkPOmz34PP77CauZfQE9ULz7eKWLpeRPyH6iu
         quYHUzKPB39yTjTCTTn1wYv/5hV6smOvRkLNaXCq9Pvq9RJht1sknC01gTt/R/faJWQC
         w4BAimvpMbnprRMqeVQZ0DDacJo6y0ySz7RwxpvYtszp/L6DHHzowfYE5YqPuzkgQsVy
         PR2w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=J4PeLhL7sJMKUKln74bN+WSFWNjqp9eIQUhDUjzPfBE=;
        b=p6uTIUmMoMsxYdpAtNcNqMl6oVgzmMZuKJe1FZ0lLYS1fInl/DPLldkE9WRANQW5g/
         LXnoVpxlIy0GfulnKJH4/WQ96BfZ0rYnFJer9Y0JZI6NHN+buO/anTDxHXndzqa6o3M8
         agzqpyVSRdL8rIEdmfAbxQI5PD0qMyYmsHwqeWFBJzdcepml4lYisPzGgdCcw7KrGsvI
         QkavlRf4TpFjXxs2ZuREaIm5EuhWeswv/fbPDhrPI9dyMzdC7QYfi6/hvWj5UzBSLKoJ
         VM+s2xw58/m4wnV5EljJJOhMeH2Ngaj8UG5gcsJToeG5L2/Q4HIVrJisSzIH8onMAslb
         vBFg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=J4PeLhL7sJMKUKln74bN+WSFWNjqp9eIQUhDUjzPfBE=;
        b=dxMgJ0xlXBWTzrvp8WjTcTsfhezylg4ZxNjji9G+z/hc1MZn+W/a05CZpX6cADJrdl
         6fiaBIeYlLXs3888MzqaRTOT+31IbUwjOibVbpGWkjXwm5wBIs3qD7IuOKvX3xfMhxe+
         kLpMp7nFlSMFinP+dH8HfGf8+dDTlLErY5tuks6tflKLyIjoW7EGZbmXLEf5viWkawZg
         2FRsnBD/PJmWzG3qaAxiTMHscSDE226OAS8+8AkMLGKBHyY2i0hwCiuhjFaLA3TGwXsW
         zTa4xIqQm5Nl5g8mODrr371w5ScoOvXlPbfOA0w+Q98ADEAlU6TvUxo5fYCpcYwz24ea
         DlbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=J4PeLhL7sJMKUKln74bN+WSFWNjqp9eIQUhDUjzPfBE=;
        b=dOKrIg1YUm967QRX1Slw2YEA5JwXF7u9QAsMjdkBy0DXwgN69GHEs431bRfPtJvvtM
         5IaOjxL5hcK5du9hUbJHgv3HhKCDVlYBb2al+qIzH1IX98Vlrb3NKUggi1wOMbd5N9iE
         C3x4/zTUmQ/7gAO4deLZiqOrY754nGsnge20KiARcQQTCLHixMOnhD3l/pvg2LI5VgWh
         rasUp4GMRfx2n71TU5Q6JrQ/gQJ7F6E7Yf0ocyFiRNaq1z030Xn4Eo4Z6DXNJaBS9zMj
         +EiWphBUcsHvCWsTPiED0lvslHMnFP34O/o7KfYuoB8nVhFJaSRT9DQxkeXF9iGIVwaG
         hffg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUkg3OctzyvyU8BeHU54+7YL2AatlJIwgWw2B6MQjEbE8Kzpoaw
	dYmUNQLM6jPmDu8i6jUgPIY=
X-Google-Smtp-Source: APXvYqxpDvkLLcetJUSPesb+NH1aJS5G0++S2IjvxgOxHC6QVQ67tFbYLIUi4wJ8/HabcbBNwMlmzA==
X-Received: by 2002:a50:8974:: with SMTP id f49mr58064718edf.95.1563786751243;
        Mon, 22 Jul 2019 02:12:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:404f:: with SMTP id y15ls8106264ejj.7.gmail; Mon, 22
 Jul 2019 02:12:30 -0700 (PDT)
X-Received: by 2002:a17:906:4354:: with SMTP id z20mr12108795ejm.163.1563786750565;
        Mon, 22 Jul 2019 02:12:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563786750; cv=none;
        d=google.com; s=arc-20160816;
        b=0rznr/PqQ1WAEwhaqncxqUAsQyYo9mgVmXsWFIgYgWgrLziJ4m3LNZMJj6uAJe4/2r
         qd5q0x0p9CxKCPk2xZL4pLKV0wYuBC6LkzCL0rvLTLD4v45gXxNxpuYU9gB+Jsr7O4kJ
         0R5RrjXHgABcH1ky8JfP8Fk3wnJOwqckgYCGCEdQ1acaXKly2OHFLJ8WvkqecwUV/lfs
         /QMgjuz35zRsOHo0RSZF8m30N9f/rVCq2TpbF3SllOdAz0tCNq5UFzv312j7gFzCr/V/
         ULtXhlh9BxZy7rNj/WVSo6E7JRgtK1eN9a6hMhY9osdiw7veMRO8HmMsEpp13Rrkiygg
         X42w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=9DjLELY86O2rj0KiZ09u8FmX+Yyp3l4B0QzBexmTiqY=;
        b=al880Jf3W2nyufYgoaYHaP/eN4s22JCaPj1GL0iMLXV3mFDBZVvnXthYhCTO8YKnmr
         X8oCKN+GqDU7YmkO4Y/8PNwu7jwbG2/jhPRf5qKi7Vfo14loptRi/3xN2hBcDmFbKAuZ
         rny2lK5ZoBgPUISvt2iIxTsKri8kVoiZrULxj2WxL25S4CfCWBSDvy9jr0pgOz7vW6HY
         IlclwcH4Q2mRHKcX/KAriOOQISWXJgVioH9Gc0+2PbAmcVa7BfcyM0ls81GMuiBJ4jY7
         R8MCs23gY/5ZS5V1k+1XwRbNYNiaFxSMqLWutNfpY/lMKov0PXnOtGZn5h4cxlV3j0xq
         a+AA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id a41si2095852edc.5.2019.07.22.02.12.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 02:12:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x6M9CTxn004004
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Jul 2019 11:12:29 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x6M9CThF026237;
	Mon, 22 Jul 2019 11:12:29 +0200
Subject: Re: JAILHOUSE_ENABLE: invalid argument error
To: =?UTF-8?Q?Jo=c3=a3o_Reis?= <jpagsreis@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <a8a5bcdc-c3b7-459b-9116-fd4a04f2f02a@googlegroups.com>
 <03e07418-13ad-82ea-20fa-140edcc28bff@siemens.com>
 <523d1079-ea79-4aa2-ae37-678146ee54be@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <719d06c6-3e84-6cd0-85b5-28719dc8ef05@siemens.com>
Date: Mon, 22 Jul 2019 11:12:28 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <523d1079-ea79-4aa2-ae37-678146ee54be@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 22.07.19 08:42, Jo=C3=A3o Reis wrote:
> Regarding this problem there was no inconsistency in the build, it was my=
 fault,
> i just using .cell files from master branch instead of wip/coloring branc=
h, that
> was the problem.

Ah, yeah - happens. Thank for clarifying!

Jan

>=20
> segunda-feira, 22 de Julho de 2019 =C3=A0s 06:27:36 UTC+1, Jan Kiszka esc=
reveu:
>=20
>     On 20.07.19 19:19, Jo=C3=A3o Reis wrote:
>     > Hello,
>     >
>     > I am trying to use coloring on my board, using branch wip/coloring,=
 but
>     when i
>     > issue "jailhouse enable root_cell.cell", the console outputs
>     "JAILHOUSE_ENABLE:
>     > invalid argument".
>     >
>     > I've modified drivers/main.c to printk some steps, and i've noticie=
d that the
>     > jailhouse.ko generated from wip/coloring branch doesn't get the rig=
ht value
>     > for=C2=A0config_header.root_cell.cpu_set_size on=C2=A0jailhouse_cmd=
_enable() function.
>     > The value for config_header.root_cell.cpu_set_size should be 8 byte=
s (it
>     comes
>     > from root cell config file) but somehow it reads 0 bytes.
>     >
>     > root cell config file.c
>     >
>     > =C2=A0 =C2=A0 ....
>     > =C2=A0 =C2=A0 __u64 cpus[1];
>     > =C2=A0 =C2=A0 ...
>     > =C2=A0 =C2=A0 .cpu_set_size =3D sizeof(config.cpus);
>     > =C2=A0 =C2=A0 ...
>     >
>     >
>     >
>     > When i use the master branch, within jailhouse_cmd_enable(), it rea=
ds
>     correctly
>     > 8 bytes from config_header.root_cell.cpu_set_size, but with wip/col=
oring
>     branch,
>     > it reads 0 bytes from the same config file.
>     >
>=20
>     Maybe some inconsistency in the build? I'm checking back with the fol=
ks for who
>     I created that branch for testing purposes (we are still awaiting a r=
ework from
>     the authors), if it was working fine for them.
>=20
>     Jan
>=20
>     --=20
>     Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>     Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/719d06c6-3e84-6cd0-85b5-28719dc8ef05%40siemens.com.
