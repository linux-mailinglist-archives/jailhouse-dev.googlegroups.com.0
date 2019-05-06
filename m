Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRB6VCYHTAKGQEFSVSKIY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 8983A15007
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 May 2019 17:23:39 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id x1sf2217154ljh.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 May 2019 08:23:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557156219; cv=pass;
        d=google.com; s=arc-20160816;
        b=FPaAWZMw7qZejsekC44Sf0sGU75VI65thCyI87o+y0W3Qaw2WniGy3NASx56Nkx9IW
         0n1Ito62S9DeoPho6j2FvVcjbNHFzTqdOy1yJyb811YqsAKiP0ho35qEP5UQRylv3PHY
         Mt0PaM52iBJKIbfVIxa/Ctjhw2cyOb/TP2Y6Im8V/QSxss6XGMeMPweIDA2ui7kAwdQa
         unOpb6SA3c8WaZC0G/j9Iz9gJFOxIyZd+cDV3LrDRK522o/HVlfcuMrzTPeFbh7r3vPo
         cTfV8eqouc0L6xS0bpG90rspz6Ahlsy33VOZYZFqZOmIkVhyIv7GRgfW24t5n2yNpm7t
         KJ0w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:sender:dkim-signature;
        bh=EkNU43PjGRvkKxGGRfOaxgt7i81XGgqPuAQ+R4IauXI=;
        b=bKppHZncQWSDaPN/fresCCxW1YWDXXgMxBjC2ShBAcOan05B0SlbVZfsGWB+dOje+R
         ErCdd3nRWk5n+lyTpkCZZY1+qUHDEnWDqSYOfALsZBmwezX5PmufbSRm9A1FpgdUsRMW
         hrGc0OWEo2DCsPZ5lhI9gEzHmwqKvx96ha6NnqfKv+fWcsgvq347TgSI+UuaLvV2cZy3
         s7DFtdWd9Idj/74fLoo0IYe8Cr+3cAHVGPC7s/M0HBIb2WZKlKQQfHL/5eMEphVkMRwd
         zTyzohniG+Rx5fPOi/9G3ElCRCEGtd8cE4LpVWf8XCcejBJkHIJNx4GZJXm4dXeE4QLk
         RIzw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=EkNU43PjGRvkKxGGRfOaxgt7i81XGgqPuAQ+R4IauXI=;
        b=HV4lA5gvMV9fwwDxpZTyG5vrF1oSjx/9OlICZiZw8Qj/mhc14RmCNuI0wgvksursC7
         kQe43BUa5HIsBSVa9F4IycIJ/klVAN/veMkzOMFNQxz/qbq/M7Zs6zDY/7g5I0xFPxhK
         Phu2zbfcctWUIhk5sXpI9SE9HHt6/atxY8XZE6TI1Qm6yzogv5n1iYmnmlrE6t1btgk0
         wGKsrW5uoTe0xV90G6qJKwJmLS5Ov31m166PaN0NEkTT34Ahisd+BUhZWME30qYRP+Ei
         hExluiGxZNL3g+ULNQbV3P7q1SyHUnwhKrBiiYAuW3jUVA02sUAkWBIGaKYV2UJnt+if
         5Wog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=EkNU43PjGRvkKxGGRfOaxgt7i81XGgqPuAQ+R4IauXI=;
        b=p0EpqoO5F4et+5mRSY4sQSkjHihVPAwN1rBCMDZnTEixntvSNl0igupP8bJycuLUyT
         HHUJPQpnd6tTafP3LIRhKC4qlpuSaM9CB5vezAKuQVt03Vn3z0f9g6D1naPfabyu2s3x
         Abo+8RdpFF/tc+d2w4QpDm52HyUQwNwlozKt1+w4TG3iwZUG0G10TmyWaDnKN1XbaP0Y
         ekekzE22508PKpkftfKzm8Y2bsakCMN1I1hm+jTg6ubvE5qay516bvEh3gBnkhU33ef3
         ngMetQwNpjJfqEHBXP5cmmgg5b/PTP5GDeIY/50AOp8Udv/sIkTYhNkjgbOIEQLz8hFm
         FCFQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWSBE9H1QoXfVWoypaPQMmQmHlDNm0cdqEqoHqvTyPdvkDh3fPY
	4pipl0xHb65cd14V7p2LojE=
X-Google-Smtp-Source: APXvYqwzHpFH/owO+YlRQ7r5b9ucdygW7Ggg0TZFPTd5hN9hRVgrC9Pg9LOfLK4EmIGzZj196HQiMA==
X-Received: by 2002:ac2:518b:: with SMTP id u11mr445656lfi.30.1557156219116;
        Mon, 06 May 2019 08:23:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:1d4d:: with SMTP id d74ls765760lfd.9.gmail; Mon, 06 May
 2019 08:23:38 -0700 (PDT)
X-Received: by 2002:a19:4f54:: with SMTP id a20mr13086287lfk.136.1557156218497;
        Mon, 06 May 2019 08:23:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557156218; cv=none;
        d=google.com; s=arc-20160816;
        b=wXoyEh/IqjHjjRsL1fQRcmKbIZM0tM+qE2IMHS2/69emi0B7zSAf2c72kFeqMAOwuF
         pHcD5Qt89A+0nSQwo3JwXiWUwyOSc4M9PwFoJToVEHvN6UrkQd+B6Wy/kLrqQPpLvxOC
         7aUe2nWzKJJHAhOVNtK8nqKNsfu3myUU+2MwZrhbq2MWl05fzvzBDNWN5zrHtb94Mtua
         zPFkm+Zj17E8igG5fOM7BLXmIN46psdR+NVeYoKCGOE+VgsyBtASakmQEpsBiz8NVG7h
         Q4X4HIZIR3aHGxF1xbKkII21mgOj0M87rJnuZO8aHi710cHDjS3t4FkMJ71hL+p1P8M9
         LtKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=jrYppCczprHVN6vi1GrHH8i8GsOQNKV/JKEebsx3Gwk=;
        b=Q2s0W67/UbUByPktnbaNGr7C8cBhFxKFvnd2YCgEOLlYgyZYFUpj9+2g9zyHzkRo4n
         bWYemC1K/+QmdsCKsACsRG2k9To9t1l+02KBiDU9RmHOAKtco9ZNdOPGrDzCXatWbntq
         2upt5+CXpSdBbxrsb6rJJKzidypY98t/ZMZMWyXwqPjBAg+8wCMGOWt+Px1rtd6OgwLZ
         Pg7zeslA8ywTCnEbMIS/Yc0NgPN1JyQljo2942HZhJ/XJru7FB0Zc6R6NJ3FYkAfDYvl
         aOu4j+dvIEsI3KlDIbTHz5sgoM0jEmgy56V0mfGXY11k6FeZx4Y0Rd2uaq9nsctp9Yda
         4mSA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id m25si481251lfl.1.2019.05.06.08.23.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 May 2019 08:23:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x46FNbTh014452
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 May 2019 17:23:37 +0200
Received: from md1za8fc.ad001.siemens.net ([139.25.68.211])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x46FNb4p004776;
	Mon, 6 May 2019 17:23:37 +0200
Date: Mon, 6 May 2019 17:23:33 +0200
From: Henning Schild <henning.schild@siemens.com>
To: =?UTF-8?B?SGFra8Sx?= Kurumahmut <hkurumahmut84@hotmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: Re: [PATCH] Scripts: Fix for Parsing DMAR Region under Reserved
 Section
Message-ID: <20190506172333.09b708a8@md1za8fc.ad001.siemens.net>
In-Reply-To: <c65a990c-77f8-4289-9133-30092a03178d@googlegroups.com>
References: <62e83024-118e-4109-ab5e-330bec67389f@googlegroups.com>
	<20190506104344.33303fdc@md1za8fc.ad001.siemens.net>
	<c65a990c-77f8-4289-9133-30092a03178d@googlegroups.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=henning.schild@siemens.com;       dmarc=pass
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

Hi Hakki,

maybe you can comment inline as well. So everybody can see what part of
the mail you refer to.

Now as far as i can tell you are explaining the difference of call by
value and by ref and how that affects return values. I think i already
know the basics of that.

My comment just was that

value =3D function(ref0)

is not a good pattern when the existing code is using

value, value0 =3D function()

Say we did not already have the above pattern, the following would be
possible and not mixing up both

function(ref, ref0)

Now i think there were more comments, so let us take this back inline.

Henning

Am Mon, 6 May 2019 07:45:46 -0700
schrieb Hakk=C4=B1 Kurumahmut <hkurumahmut84@hotmail.com>:

> Hi Henning,
>=20
> I am not a python expert. But it works because list is a mutable type.
>=20
> https://stackoverflow.com/questions/986006/how-do-i-pass-a-variable-by-re=
ference/986145#986145
>=20
> Some Link content:
>=20
> Arguments are passed by assignment. The rationale behind this is two
> fold:
>=20
> the parameter passed in is actually a reference to an object (but the
> reference is passed by value) some data types are mutable, but others
> aren't So:
>=20
> If you pass a mutable object into a method, the method gets a
> reference to that same object and you can mutate it to your heart's
> delight, but if you rebind the reference in the method, the outer
> scope will know nothing about it, and after you're done, the outer
> reference will still point at the original object.
>=20
> If you pass an immutable object to a method, you still can't rebind
> the outer reference, and you can't even mutate the object.
>=20
> To make it even more clear, let's have some examples.
>=20
> List - a mutable type
> Let's try to modify the list that was passed to a method:
>=20
> def try_to_change_list_contents(the_list):
>     print('got', the_list)
>     the_list.append('four')
>     print('changed to', the_list)
>=20
> outer_list =3D ['one', 'two', 'three']
>=20
> print('before, outer_list =3D', outer_list)
> try_to_change_list_contents(outer_list)
> print('after, outer_list =3D', outer_list)
> Output:
>=20
> before, outer_list =3D ['one', 'two', 'three']
> got ['one', 'two', 'three']
> changed to ['one', 'two', 'three', 'four']
> after, outer_list =3D ['one', 'two', 'three', 'four']
> Since the parameter passed in is a reference to outer_list, not a
> copy of it, we can use the mutating list methods to change it and
> have the changes reflected in the outer scope.
>=20
>=20
> HAKKI
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
