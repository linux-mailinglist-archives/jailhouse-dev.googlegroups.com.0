Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKE7ZCEAMGQEO3YGW5I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E103E52F5
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Aug 2021 07:33:29 +0200 (CEST)
Received: by mail-lf1-x13a.google.com with SMTP id d3-20020a19f2430000b02903c3ec8dea5fsf2112897lfk.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 09 Aug 2021 22:33:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1628573608; cv=pass;
        d=google.com; s=arc-20160816;
        b=A0aEiTnaopnzK1lsUDL+17KRjYp2pCahQc9af9VuYhIlRDRnOVn7sKkLkm0Kty5VYX
         dhcPPzQ3Et9bsdFEFGoIJEPF+hWVOI8Pd6Li/3qIOxivYECVIabqh55a8aQxu5KGWjpJ
         gjcg8UMmjyYotS00mT+yu47fWW4Hg0R6n8ghB+6+G4x+FC+GN6OLi9LW8MQio0Y1I4ON
         xC7p6lMGO54k1W2wMPJ6yNQVdIKNf6C5iUHp80VrLrwKhOCeQarb/re86/Nv5r3hbSPk
         5hh4xoco/piJKAbgKXXRg7kBCJco97RkUIcWFXu6KBs2Xn4ncix3QdlPn3qYOaWj+aiW
         VIHw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=yBe+gJlcTNvYPKsyM8yLyaf09yiYCf0OGd3nbptESKw=;
        b=Qq2vwNeX+ysdeyFJ95/9xO26LILRRQ+ziKgUC0/m6P90q84uMX8roUy0pO5+l4kjKM
         3AdPh/DcP9mE9yeRuY3LnVuLwGBfny9u4JTszaXfEbK7lEKD+YO5X58n3Ekh0L+DIbbL
         7UFYd1IV6H9w+SZUy6x9OD8FrbkEZKoXigfz3fKw1mGoIO9bIHsKCv2rbN/7U3eoByJ9
         Ct2DQsn4Ma/UvbdSyEYbsQ2684567gWBRupl7wlFxwPkLcHyU2R2bXAeNNa0U1DHJShM
         LF34WePrY/5nXn0cTHSrtmfObzr94Wp2GuspXEeqGt6ZqVcLFv/5CXMjvGKIUQ0tKOqo
         Zolg==
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
        bh=yBe+gJlcTNvYPKsyM8yLyaf09yiYCf0OGd3nbptESKw=;
        b=buaGzYz/xfP1Zu1nf3YfCBHspjOnMnid7uc9WG3wL1Gv/fCbhLt7pFYEt443SQvtXS
         eXPcraMwGYc5hg79VH23zJYbyRsCCpkHA30MbWsVnAcVPYDzTYn6fEWBlFFtbtlmcCjq
         AwWkxP46wLSuzQ1CZXVy2pMLGS5na17TVegFSY2ccT//uHX4tyT7LQQhHvHdGMIrF2mN
         tyfvXpg5EEjjC7UeJUPClrNtWxAZyuoNkteWPeiTPbeI2z9/5V9QKKymdlbLi96g4S6u
         cW2HpLFVhYn+4eF6T17sz0hJ7L2W0MvYlUd/BW6YS/ISzKuEs/PQnsKcNf6piWKJdLaS
         ORFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yBe+gJlcTNvYPKsyM8yLyaf09yiYCf0OGd3nbptESKw=;
        b=NHPDQ9Pp97hbF//ccP86PvDif+J5d+noZ1nG1Kz+/OO43o8OAZ6h547jtVFhbfIGwL
         S7N6KHAxM8JkRb9I2Gr2JSjmwIjYusx/6EuLVvPyrBarHuSJl9TDRGhalZhl5k6x6fef
         IX9momJOrg/RXbYd8Q3/72uwg3ruuT08eHzpOy350n8G23hMWtl9W4L/TK0HJ+OZ3ytq
         VrsIdcYy4UXUoxS4HI5egVi8VJDzLWRjlJhu6b/Dx4LriN0WWL+rrGVFhpyZvdrQUQ+l
         W3yI4CAbEDV+MKrKaKPuGk6bPadlCi4DkZMkKPIQS3LMnCbKMpr+MDkslhNivd7qgP+O
         nrnw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5326/bcyEzSoxlwIdHQOy1anFvcNFPxsd+9Wd+RWNuQOD+9CUPy6
	S2krHW6XV5VfchgB60njj9c=
X-Google-Smtp-Source: ABdhPJxRJurV7+99lPbbVRtmVldlZNRcSY+Rh0IAw3B05mXz/eboQ1yyFpaFFzJFkjyVL/TewaBWyg==
X-Received: by 2002:a2e:8350:: with SMTP id l16mr14927135ljh.257.1628573608679;
        Mon, 09 Aug 2021 22:33:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b5c8:: with SMTP id g8ls740758ljn.6.gmail; Mon, 09 Aug
 2021 22:33:27 -0700 (PDT)
X-Received: by 2002:a05:651c:906:: with SMTP id e6mr17599807ljq.160.1628573607282;
        Mon, 09 Aug 2021 22:33:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628573607; cv=none;
        d=google.com; s=arc-20160816;
        b=NTCcWn9MFIBmfOyI7xZpz+5VlbWfY7bvuNNyREG7fxVlOLisqLW8BRZWM/6kocvj8S
         KfaDELN5rT8ZJC51NzraxXVYS9Pm+wsQ4VwJOu5X2rTdA3eAxIhunVuP2ZUcSoUmQcs/
         n+svWyXlfmY5KQX+8Jw76CK4PsLIVLVt8/OZ5b4uPuQXLrhYPToWpNhXLLDfV78TCcP6
         7BX01GemfsSXJxWWcqqI8fIUpbOufj3EL3m+uAwS0jixkS2Bqmcd8RtBqCtCgf2db4kf
         yq8N8jUN7rxEmEI/2CWLwBVlkyTmXSOl/PL+XJ1PHStgvDlEJRpaBMaeF3SEUiGQtFux
         lnTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=DecPuKIvpsphcqS20J9ngEYx7eKwZmluDg1u+/RlOGE=;
        b=whn/QsdDuCfd1GrL3UA6GZkcKo1vlnQ2YTb6fkk3AAY6X3sG+2cgTUaKsNjjPsSg3u
         2Wa+H8h6j+buBpij1GofV1VHT2sbOzIK5LeJ58zojV8N6gs2rU+oKJ2jPzlbNjHb3VP2
         6BJ9Uo4sBVEmu87JJv67KuiQOe6TU8wdneSIeuKoW9qC2IkzN+ftruEGtx8ZyJqn2qGV
         pbWuW/aP3rQbSbLTdna+OlHB70aAtlB2W5C6eUnkr7gzpKTInwNF4KbC1sIwOKUy6sz4
         jEfzbmHc7ZG2BX58BsDnJ/yrj4KcJHlhB5qGjYESdh8MacjaDwwriM/hr3IosqF5lB7S
         Deog==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id i12si1059004lfc.10.2021.08.09.22.33.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Aug 2021 22:33:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 17A5XQTj016083
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Aug 2021 07:33:26 +0200
Received: from [167.87.33.23] ([167.87.33.23])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 17A5XQdj007240;
	Tue, 10 Aug 2021 07:33:26 +0200
Subject: Re: Qemu setup for testing jailhouse on different machines (amd/intel
 host)
To: "jsmo...@linuxfoundation.org" <jsmoeller@linuxfoundation.org>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <CADja47POaMbuona6FYVzgzwuQGawEF5x_ma-xAMYWXMpO2tnXQ@mail.gmail.com>
 <7c94b762-9d7c-59a4-a997-da39ad1fd122@siemens.com>
 <20b390ac-b2c5-4a84-a034-4cc10731781cn@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <3cf249ca-bc17-00a8-cc6a-5713b2e5a81c@siemens.com>
Date: Tue, 10 Aug 2021 07:33:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20b390ac-b2c5-4a84-a034-4cc10731781cn@googlegroups.com>
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

On 09.08.21 22:29, jsmo...@linuxfoundation.org wrote:
> Hi !
>=20
> OK, I'll retry on Intel and give AMD a shot below:
>=20
> First problem on AMD:
> root@qemux86-64:~# jailhouse config create -c ttyS1 test
> Traceback (most recent call last):
> =C2=A0 File "/usr/libexec/jailhouse/jailhouse-config-create", line 268, i=
n
> <module>
> =C2=A0=C2=A0=C2=A0 (iommu_units, extra_memregs) =3D sysfs_parser.parse_iv=
rs(pci_devices,
> ioapics)
> =C2=A0 File "/usr/lib/python3.8/site-packages/pyjailhouse/sysfs_parser.py=
",
> line 457, in parse_ivrs
> =C2=A0=C2=A0=C2=A0 f =3D input_open('/sys/firmware/acpi/tables/IVRS', 'rb=
')
> =C2=A0 File "/usr/lib/python3.8/site-packages/pyjailhouse/sysfs_parser.py=
",
> line 90, in input_open
> =C2=A0=C2=A0=C2=A0 raise e
> =C2=A0 File "/usr/lib/python3.8/site-packages/pyjailhouse/sysfs_parser.py=
",
> line 86, in input_open
> =C2=A0=C2=A0=C2=A0 f =3D open(root_dir + name, mode)
> FileNotFoundError: [Errno 2] No such file or directory:
> '//sys/firmware/acpi/tables/IVRS'
>=20

You don't have an (AMD) IOMMU. Or it's disabled. That needs to be fixed
first.

Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/3cf249ca-bc17-00a8-cc6a-5713b2e5a81c%40siemens.com.
