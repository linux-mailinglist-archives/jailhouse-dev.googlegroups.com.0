Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBIMT57VAKGQEKQU75ZY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC1995C2D
	for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Aug 2019 12:21:21 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id o5sf6769802wrg.15
        for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Aug 2019 03:21:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566296481; cv=pass;
        d=google.com; s=arc-20160816;
        b=GpyfL9x4KLgceQ/PXitFh5dMGp7l1o2MBRyXqXnijaNQO/Wn4nCJafP+w0cMyVK4Pe
         Ktwqbpm6tEQ+3icvgVjyLiP+6KTisLuhckLIPA5XeXT7ODGYECeEONfUnkHJ2iYsUyPB
         8OQUR5J2Mb2YbTgKtlksTa4bhzbrVfTBCgppUzqQ8OfaHeSexKrmdvhJ0wKDMJukoaBg
         0064HADNJwgFBNie2zRMvDRlrI/hGZ9CJv/f7HM3+IO94COvMrhBye3ffoCDq2fnlI06
         4Msv7pcVMm+HIj9/0/eY73X+DiMNonUu6TcjMB2FvmPLNvHSripBwNrSMHLS27uHgIMa
         bCow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=nCptwuJila08io1mde3E3G5MzD3gVHFusp2kZQx7+cI=;
        b=fe7vAioZma0m0hH9l4YnPvFVNWiONl6WR5lc5qesqcroys3JuQp4w5RJeaPp9MlcbB
         22vglhIABKg7obbZOXB/nE3xbYvPQ7gUAn06FG2FMcedb+DaR05G/frRc9AvAPIhZXvA
         Ej45ii9ZWFTvdzV9Y5YUIkJC+p7Fv98duQj7j0xkatUGpIRLfzUoT11t4ROK9ZpSMmjY
         b7kcLxgfGY9a6vU5IQ4spVvFYg0pGhA/Wov55PsCXT0QQaFqZx4lEtv27akEocFdXbIA
         V9VEHzpiHsv/fiK/Xb2oi3YLZt2l1Mf9L0nEFdT490nCCkdLM4i5StArNwrZLiQxtxxR
         h5aw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nCptwuJila08io1mde3E3G5MzD3gVHFusp2kZQx7+cI=;
        b=P7aMecVRzXXTydEH0gKrBOxdNTigQE9bMZwYcuGZVH9WuhOQBFLMHolItDYu+qyJ+V
         8uId2WMI3uUOUVZzycumTJX0ZWFzQh8L76l6M2oU+mhuLvxbXRbnd5d4wZ3Ho1Ff7frc
         ULq0hof29BLLILUFIg7/CbSWQT9vJILqX13F/ywE3uz26zsARe6Lyrv+j4qdBq+7N3Tl
         KzWOaiavuEAI5n+L2JiksZdEsiHhIJjJMnrvin+8oB2FP6bz6l2xxNNZRuyFD8fIcDRG
         i4cTdc3EvZhiWFwaI1g0BZ8TkxTEeWq2MQpxBQp7ALQyXnu3FKzxw9Eq5e0PuIjivbjF
         d6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nCptwuJila08io1mde3E3G5MzD3gVHFusp2kZQx7+cI=;
        b=YLswOQ4gkqpO4iY09x3/2dSqw/QtpqAWD87zjth10b4ooP3V9kZ3sdartlxvgsW4MQ
         Qwr+Vxr/Lk9UpqejZgD4JcZyzpisQqNHR+fwteDDgom6CD5uMpgVEnTWZx+iCA9Qx51+
         XC5Y89kfQz6BKwhOBqTCA79Eg5Fr9k5zxBB7OmpWjQbS+2gzOZ80YENhqkkFdUWEZcLj
         FdYLZvq4/1uA+ns5FZBpcNuDwHsXqaVYatdRATLuRD7xz0/QatpHp4jDnnDNdrsPLlhk
         5QhzeIDKXKIqvyXcMLs5pT5Q8jlLiikEl35/appr8zBpsdFCbWJGxxfXWdeoIQJCZIUP
         Cp7A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV8i922bvp0rGeTa8oUH4MoRLkJ2KcqihGJIrWOQn47iSwyk69U
	C9F58YdCJ5QckS4oFM37v9Q=
X-Google-Smtp-Source: APXvYqzIy4qhaX0+H436sDaUqjQh/EafwyswESfCyK5FEo+66WdQLV7QAWfW+o2tcqNPCF5k3/Fzrw==
X-Received: by 2002:a5d:6b84:: with SMTP id n4mr8189826wrx.118.1566296481211;
        Tue, 20 Aug 2019 03:21:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cc01:: with SMTP id f1ls784275wmh.4.canary-gmail; Tue,
 20 Aug 2019 03:21:20 -0700 (PDT)
X-Received: by 2002:a05:600c:48b:: with SMTP id d11mr25812526wme.55.1566296480053;
        Tue, 20 Aug 2019 03:21:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566296480; cv=none;
        d=google.com; s=arc-20160816;
        b=pEDeRr7cXg1XnVHS+omj0sfsvwXFh5lCjxGAdOqXaO3/lrnnOHvnuh1p/pE5cFf1wA
         dHC/XAnWHcgT/N+oI2fYZSEEicL6hrULVlMtJMb2d6RUgG3EOCx1/1dmAXxPHgzeBAXm
         R2l8Nf2L+W4BBb7YGop0nQJISNoB53/KiYAxfwN/SKgordR6gpZRSQsE89xOIGBW053h
         gyjhGPPtmaNCw6xGshcA5PK/V4xuj4W6VzISXWc6ToKY93bF1NF5x1G6AwXjMWSq3PgL
         NhHrIs4dNPhz0BjivAkI5Ivc8XbAaFjQVhcLoY0+JyJendK8LcusAgPgRqHCBHqLvYn8
         B2FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=zql9gZUBySYCeSzEwY7e7JPVwJ76uZJzlJBOctJe/g4=;
        b=bDyRgZ7WQNAxgYMH1lkCRL1A0h8ajVdzATscdRH7xqHjDe8oGqaT5mu6I2bRHyutAT
         AhTdBLKpLswwKg5BfGH5NWoOSXqGsfSLSaJdCc8QGLmukSKH9vLsGqVmPuIpQJ3H439x
         tZ/EWmhge9bpUuGqtd69udUscIDLbJ/WadZFXVi/nJxdJCavAZBOMBaANQzOwyn7ZJ5D
         aSkvYa9GT34CNAzRYSCbKG+N/V5qAPo+CNgbrfJj1GNJP2hDPaUozXVTpj3xtJvMP3fa
         /tQhi8MDNtYtq2m8Rap6JUW64MDd0UZAj9OeLyLC/jgAClH00W1cb/Z7QtF14NeC02H2
         TP9g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id r13si975390wrn.3.2019.08.20.03.21.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2019 03:21:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x7KALI65014349
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Aug 2019 12:21:19 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x7KALIbk001628;
	Tue, 20 Aug 2019 12:21:18 +0200
Subject: Re: iommu translation table length for arm64
To: Oliver Schwartz <Oliver.Schwartz@gmx.de>
Cc: jailhouse-dev@googlegroups.com,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
References: <56296140-3149-4CD5-BF93-0E27EDE38819@gmx.de>
 <0d55b247-d84c-fc56-3eff-835388e6b9a0@siemens.com>
 <E1ABA3D9-DAD1-4412-8D04-BC885C3C6EB9@gmx.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <34b1aa37-ac4e-b311-214e-ae5cb853d1f8@siemens.com>
Date: Tue, 20 Aug 2019 12:21:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <E1ABA3D9-DAD1-4412-8D04-BC885C3C6EB9@gmx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 20.08.19 09:45, Oliver Schwartz wrote:
>=20
>> On 20 Aug 2019, at 09:04, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>> Feel free to send some patch, addressing the differences between ARMv7 a=
nd ARMv8 properly.
>=20
> I=E2=80=99m afraid I=E2=80=99m lacking the necessary understanding of the=
 ARM processor architecture to write a proper patch (plus I don=E2=80=99t h=
ave an ARMv7 system ready for testing). My rather hackish approach for now =
is to extend the table and ignore any mapping request if the index exceeds =
the table size.

I was thinking of something simple as introducing a constant that defines t=
he=20
number of entry per arch. That will remain 4 for arm and become 512 for arm=
64.

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
jailhouse-dev/34b1aa37-ac4e-b311-214e-ae5cb853d1f8%40siemens.com.
