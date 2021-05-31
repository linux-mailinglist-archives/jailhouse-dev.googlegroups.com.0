Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBT5F2SCQMGQEPWCS56Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc3e.google.com (mail-oo1-xc3e.google.com [IPv6:2607:f8b0:4864:20::c3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE703965C1
	for <lists+jailhouse-dev@lfdr.de>; Mon, 31 May 2021 18:46:09 +0200 (CEST)
Received: by mail-oo1-xc3e.google.com with SMTP id o21-20020a4ae5950000b0290211a73e7f50sf6522864oov.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 31 May 2021 09:46:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1622479568; cv=pass;
        d=google.com; s=arc-20160816;
        b=amYHBNlhEC4yye09R3q5uSF6iSVqK5JPxaPSQ0+SFflEil24cpjmBUaoLPqAiWD776
         S3LJBbzmQpCOnPebVYtZpIK75Vm67sNXwrnszqlTxA7TAssG+PhYEQ1nxUaYnMxYGfzg
         YE04Yhx0aTWHF8got1mCt+nnXr+xVP8wbbvvafAhyfTO0Cxyrz2DDQKRQ/iDk7acSJpu
         RNTHpU/DEGqnAalmwn6zG1g6ON4VkcqGcZU21EQ88EDMJ71sVg/cEjaAGIBc4CQgrFHW
         fcMqbd9VLTOyTLIGX3cLE6+BA37xfEutl621ROj3EXsZ5zm0u35+hm0sCXj2yaQOfe2T
         zQog==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=Z3zZ8ZteUWH5sTi9c6ZNkQllpgGMbTmQn6dWSn813Pk=;
        b=ADNVQYSj7vUC1OO8bAyB1/V+Eyqx8proqo2tNOW0eVFDPEIheXPG6IDwvdPJj0OLFN
         SoybslaWPn6vXi9rB4AypuHPPdHYzezwZivUXnEuqF+04WzCj0FUBPlp0+57Qxyb12Kt
         T3FA8a51rrLhzoqp5L121GODhw15LvAQceq7wVjXh/SbQQmKqDftFOx38ptZ1kwxRru6
         1kkD6lgtvjbvnqEAWTdnv2Dpkn3UYW2naCxNYNzrIS51ZL85tB3Rm8g+zJmGKWS9btFL
         v0lqxwhlo7+YorONgCz82I4tOp2LYIn/+VgqNTqkHHEEqSIkWyA+rzmBZv2JeRk5IFzz
         6l0A==
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
        bh=Z3zZ8ZteUWH5sTi9c6ZNkQllpgGMbTmQn6dWSn813Pk=;
        b=S3YKbaun5UQZJvYJ+YYvmV1iWLinnycuJ5cvCE6FkwMn8BLiaxlGKdcoDIP+SOBJyc
         5XWy83d2FzHB6Mil/d5KODXlfHMaIyZMGAWrPRw23e9kLILy8q3GiC1mDkgMvAspwCvY
         FYxoGL9f/Hj1w+AggWWn0H+CsmaA8yVkEuVarMYy3UMTINzYsKT0enAOIgXuGALEYGeH
         WBfxxejl+chYdgtvDY9Iz3yejVnpABwRvaUu0pQZmExDQdHTxmKUyrGiR6yV2QaUzuUY
         9sHm2qw8EjYm6n31ZZIZKikMox+4vX062ZjHvNDs4NnJ5IRh9gn3KgmDEn4t0o6zaKuD
         Omqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Z3zZ8ZteUWH5sTi9c6ZNkQllpgGMbTmQn6dWSn813Pk=;
        b=JeJ0ypMMQhG+bsld+LC4iWVyHK+IqisfKYT9CeqkvZ843mA4Z5CicIEsqyQxhRaCii
         5KzNq1/aR3t3oD9DL7kzsh0SyNatEduirOS6CwpRBZHJHfegV7ZKavUl/sfUOUIydM6E
         3LZREQs+3rPgFSRJh0R1eItuT/0rPFPM+E3AO6WrM4IprZXVVowsLHIKpAAS+OnPBGvs
         VjSyQYi5PQpQ7miG0cClHkMNTvIqJU8Kw7iE5Gvepu6VFYBIKgltRqWAbkonYxOV0DNf
         LsLGMYKoBgJEZYLL3ma6xKFuTFzW5iVSlaPScqHJjMOJ0U5C0bwp9iyFAxK1qRatMNY6
         oXsQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531GPVV+fO2KsRyXXItoXDvpd2pJ5GwINsLTpYd7DI1mT4739xc0
	b1j+VJr+86wLb5cqMiRUTzE=
X-Google-Smtp-Source: ABdhPJzcmuINcMcFgIIvmXeMrFzlhf16o+987Dw56MxZsrb1HgGRxMDIW2kdQkN4lyYkAQyE7I7GPw==
X-Received: by 2002:aca:3707:: with SMTP id e7mr14698900oia.17.1622479567911;
        Mon, 31 May 2021 09:46:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a4a:e396:: with SMTP id l22ls1080406oov.1.gmail; Mon, 31 May
 2021 09:46:07 -0700 (PDT)
X-Received: by 2002:a4a:b301:: with SMTP id m1mr16842319ooo.7.1622479567506;
        Mon, 31 May 2021 09:46:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622479567; cv=none;
        d=google.com; s=arc-20160816;
        b=rR21dTfnJhDLWT1Q5wJK/L+3fNX3TFRACsoUoo8w/NvwUFd3ozmHKgF6xUkzM3BfU1
         fT4zisssYgYq4EfyfUsUFZSR6DOx/MAIbgEcDW4Zx1BlSbhU5WrQ/eoZlbPn68HNlJtE
         nPr/e+fXCIYV8KjpHgQwNqohFey0qN65dYyoFySrrS0MR4CZm7Cuw5ks/X9XkB81GqJ0
         4T0I8k1hmurdWUQs5i4tGnQmgS9eyL0v2179hDII/lex3evTjx6KSvYG3a6Oob7cCzFt
         H2gdx7vU3ILbhww5kJLH8d3L5jVljkLHQXh8IAaPisFQUMGMxiZ8TYad9ShWayX8Dhq4
         MoLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=YQ3/7BqdaCcCPHt62JF3jZiUfeQ741Z8/eTnpsKyrH4=;
        b=GyZhzqzA49F5um2R+lOGkf3AVIDwyGrZDYH6S2gBhM8q0sENcDc/lzYcMwAEMdYOaO
         r4Rf2o7btZPuvwRld6cyAi0gSL7EWGP6jkBqys1MPazKjBVhTqXbpJKWr1oSKBAoZdRf
         bYlQZ+Bf6lJ+qQo0FjPqNPzUH7qOwWN2FQ5oPapPWdYjpt55xPJ5/lb152dpn3D2sJTL
         5mYrpSOLuM2PCZK2GLG9FLlWKNgyiD3A6BrQnl8gnhiSK+nLEavGnn5ilPpfHt+K+T2W
         W71Y9teN4QHQQIhZBKlSTmm+jnZxnMY62kwg8jqdw+X6OHpivGp7UtfQy07ICOW/qkIT
         jvmg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id c4si2056388oto.0.2021.05.31.09.46.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 May 2021 09:46:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 14VGk3Sq006801
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 May 2021 18:46:04 +0200
Received: from [167.87.247.112] ([167.87.247.112])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 14VGk3Cg028216;
	Mon, 31 May 2021 18:46:03 +0200
Subject: Re: Writing configuration files
To: Prashant Kalikotay <pkali@cimware.in>, jailhouse-dev@googlegroups.com
References: <989156a0-b5d6-7672-a109-9860c5f94867@cimware.in>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <ce3b4401-63c8-bd97-64f0-8a14682f70ec@siemens.com>
Date: Mon, 31 May 2021 18:46:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <989156a0-b5d6-7672-a109-9860c5f94867@cimware.in>
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

On 28.05.21 14:10, Prashant Kalikotay wrote:
> Dear all,
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I am t=
rying to write configuration files for the root and
> the non-root cells for an arm64 based system. I have checked the video
> https://youtu.be/7fiJbwmhnRw and also the pdf. I could just infer from
> these that I have to write the config files using the already existing
> ones eg: amd-seatle.c and other files. But what I am not able to
> understand is how do I come up with the different values in the config
> files as in other files.
>=20
> For Example:
>=20
> This is small portion of amd-seattle.c how do we come up with the values
> in the mem_regions[] as 20, irqchips[] as 3, hypervisor_memory.

These a C-structures - the array sizes derive from the number of
elements we fill in below.

> phys_start =3D 0x83e0000000, and all othe r values in the config files.
> Which document has been used. Any pointer to any of the documents of the
> various config files listed in the configs would be a lot helpful.
>=20

Concepts should have been explained in the tutorial you cited, details
are unfortunately not specified. Therefore, you need to study existing
configs and translate that knowledge to your specific target.

If you understand that partitioning concepts and mechanisms in
Jailhouse, doing so should be possible (you can always ask for concrete
details here). If not, even a detailed specification of the config
format would likely not help because you always have to apply that to
your concrete case, and the abstraction level of Jailhouse is fairly low.

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
jailhouse-dev/ce3b4401-63c8-bd97-64f0-8a14682f70ec%40siemens.com.
