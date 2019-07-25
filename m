Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQMS47UQKGQETAHSH2Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0C875284
	for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Jul 2019 17:22:41 +0200 (CEST)
Received: by mail-ed1-x53d.google.com with SMTP id o13sf32351265edt.4
        for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Jul 2019 08:22:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564068161; cv=pass;
        d=google.com; s=arc-20160816;
        b=eyK95PmWwD9l2NxLMjBD2PcEHI01dTNRj51AQdIzMaxn4MtQrLjqxAB8Gt9MLpCTPw
         UnD4m/j6lhslF89f0oWUoNTrovZAozR6CE/3ytFWoy5dByg7wl9ADq9fQwij+lRBX5Ah
         MaJt+3BT1sBhKNGwTldbt/mK0p5IQG6Y0EolLPNme8xwb/j5veNdjhcaSTNyXRB/nbW2
         xNqmo4ILKIdVCMglo2rLF4JcQhkmNQLvjl3k7vDRoBokm56qSAnliseafBuYy0/6AtGF
         RvVtLdwdO061QLy+NVZatMCduoAq0yQRHQMsGWG04aPtRxDJGK7DhEIct4CflXstQG1h
         Ciug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=fG4p6tbSYAu5qnKKSzBmACaq4AkP9TbLDbP8AW/pGOU=;
        b=ElM12qjYu3C5QJLMFdRkO1Ahc+wVu1MhNJRdUWl4YYepoeyM3zBswBth4vqwfTABUd
         SEpfuRtevHGLB2mMoVLWDuB+5cEnPs2KDTF2QnHotuQWqpr4CqTNvQ2TXsE/EC5Cec1F
         pdTfSm+XOFDOyrz3cwN1JqYM0rcy7cU5nYI4+qQnqcSY232bq4v0wI8XMt/lG3h+H4LG
         FJ8FOS+RydYFZ7JOgqJhS8yMpbprdz3C+ItV99vDBKXvI/3dYb7QSpxkzD/WQH+CH6s1
         Ki04235AS+Xdo2m757xU+oRhAWQvKvnHsG3WupSru8HMGTfTUQDPxJXvazYogLSXTNvH
         MnIA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fG4p6tbSYAu5qnKKSzBmACaq4AkP9TbLDbP8AW/pGOU=;
        b=D0jse2HYwwHXgqN8Ny+uP0fuCtiQnwst1qHjiTI1BLv5XJjdVFJI8WDTym7LE563B/
         VjB8AXpA+jWlne4jpThjM5OprskZ8YDPn7GyOyrOpIBbtHN4j6AWryWX1A7IAF9BhpuK
         L8dsq7ISoN4ltYAMbzo9SPEDway0TjJaZAKL+XxVjeuS8dBcevMul6X6OC2jGlePy5BM
         ftejLBpeZMungTVsJIW1JoLXolQzZyqNhIWUhG5SAQYqAcSwCKy4ojwXt8tkltM7qiZN
         kcfyO/oyDqkT0H/NzUMVZetHeGe10Skt8+vbR8X2w7hEvTDRm+tnSF/DYqVTseX2AwQC
         32Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fG4p6tbSYAu5qnKKSzBmACaq4AkP9TbLDbP8AW/pGOU=;
        b=RdgHoMduXuqi6kjrjknsWeN986AplD1HXuBNOp/OkGKemNbjaj5zjolsWAnoB75muX
         LLOKU21Dgej+KIrv1dMQzrrxmPcEZehhUcj84+/PFg9P4K7iVqS2vNWjLCbFRHM5TCvU
         jEoex7qO/TvdqJVi6dDls+3p0h7YkA318Pqvs7wg2Q4GEK/hQqP92gx8zrmC2EuPTdIm
         EY+P0BPhKEeyeAQtz3gvHaOv9Dzc9z0uNcwD4DIRar/8waepnyGSbW2fvPDdjaQJ5xn5
         o2ZiMLtFN77tKji0j9de02V7Vzi17AZFcHNhig2q92vlT3O8P8xV6oloW0mbbt4JUyIz
         hxdA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWu3YEQFltjnyYRbsMTcJWtvi1VQagIeprPish7SoEg/hySklu5
	YZ31pFrrZGF4Zbm+6yOcjMQ=
X-Google-Smtp-Source: APXvYqyoQo8nX9sAuPRgiobJVItlZr/YhlefTmRVQb1CSf+qnj+IH1n75i+78iZ58t9jLvq3+jrn3g==
X-Received: by 2002:a50:c28a:: with SMTP id o10mr76059254edf.182.1564068161610;
        Thu, 25 Jul 2019 08:22:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:b7a3:: with SMTP id h32ls11855557ede.16.gmail; Thu, 25
 Jul 2019 08:22:41 -0700 (PDT)
X-Received: by 2002:aa7:d4cf:: with SMTP id t15mr77598899edr.215.1564068161039;
        Thu, 25 Jul 2019 08:22:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564068161; cv=none;
        d=google.com; s=arc-20160816;
        b=0LdalmZx1+IlSd7Mi63V+QmS3L9fwr+BZAJdG43IWAEvjr4jTskhD6rQ48v0NiMlVm
         lFJylvj8HdkNIPSExhyGWv5tHyKlJUOaJLmVGhogx0dA71vj/P/o+fHfru9rmdPCYiqf
         LfsA1z0ba13/QO/ftt3JouaXJaQ4Jen2SFtbNqnQ32MF5TZqDkXe+67dAcSPRgAOGaqW
         zqJaVqVUsh7z+TnVk+t2SGstv4YMYb9jZTHORitTsehzhAYEkMhFDzpuFlKexyLB/dNs
         vLW0uNTR2RaZbmoQ961nadWvXfLVakjLwj9zjHvP/MAJYxH5FdUwZKQyJoqH9Br0Hu05
         5OwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=4djnBP65hwqgNeM5tgk+IAyCxqOlaX3MiA+h5CMdrCI=;
        b=dLQH1NdcZ+ghOR37ny7hABrIxfTm8hL0+m4jLK5IdO+YXYXNPkwt6Kpex5XZsIZXvE
         shQxsrouUQRcxuKE4R7hI8ofeGiznyLqLZdm0snYEyJLM7P48SzfW32UyXED61N1CwuH
         NwzYTZOthXPx8o3dfvv3RChNdcNcI1A3hv4xncav/FfPWZDYxpQI9i5QPHVHDC1s2iT8
         t6EeGOKT6bRfqz1ECNo/+XqSRFGbaRZxtfgqnk/RVFumcrgD8L3UTQUMErOQ9j0S5lj5
         WyBKy4Z85ZTQDld3wzaRq5JxY8pZmip85j014fLTA05cD0laaFScpf+B9rpP8kzQtWuD
         0nPw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id s30si2727773eda.4.2019.07.25.08.22.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jul 2019 08:22:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x6PFMeGH021278
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jul 2019 17:22:40 +0200
Received: from [139.23.76.89] ([139.23.76.89])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x6PFMeQX012158;
	Thu, 25 Jul 2019 17:22:40 +0200
Subject: Re: Colored Linux as inmate
To: =?UTF-8?Q?Jo=c3=a3o_Reis?= <jpagsreis@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <7f3933fc-c609-9349-4e57-a680489e9928@siemens.com>
 <320981f3-9d93-46c5-b95f-ddb68083f7ee@googlegroups.com>
 <de716a1a-110f-4fac-864c-54043152997e@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <62f33b9f-a7f6-34cb-3740-2fca02468b0f@siemens.com>
Date: Thu, 25 Jul 2019 17:22:39 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <de716a1a-110f-4fac-864c-54043152997e@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 25.07.19 15:11, Jo=C3=A3o Reis wrote:
> Another question that i have is: when i try to issue jailhouse cell linux=
, i
> need to add to the script (jailhouse-cell-linux) the path of pyjailhouse
> (sys.path.insert(0, "/usr/local/libexec/jailhouse"))=C2=A0otherwise it do=
esn't find
> the module pyjailhouse.cell and it gives error.
>=20
> In pyjailhouse.md it says the following:
>=20
>     When we install any python script that uses pyjailhouse, we
>     remove=C2=A0|sys.path[0] =3D os.path.dirname(...|=C2=A0from the insta=
lled scripts,
>     leaving python to import pyjailhouse from where pip installed it.
>=20
> but it seems python doesn't find the path and i need to add the path ever=
ytime i
> want to use jailhouse cell linux.=C2=A0=C2=A0
>=20

Did you run "make install", or are you running jailhouse from the code
repository? Both are supposed to work without patching. Anything else not.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/62f33b9f-a7f6-34cb-3740-2fca02468b0f%40siemens.com.
