Return-Path: <jailhouse-dev+bncBCL6VUP7RYARB2XS6DTAKGQEKEMNR5Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23b.google.com (mail-oi1-x23b.google.com [IPv6:2607:f8b0:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8451F829
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 May 2019 18:08:12 +0200 (CEST)
Received: by mail-oi1-x23b.google.com with SMTP id r84sf134250oia.9
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 May 2019 09:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=IVgR6UtXy284FnJ+AnltzZFquLOeO6luh0Rlhr4ZT6c=;
        b=S/CMJihYjoLkZ3sgVUtqDcggEtkbX7uyf2V450Po0mvwWOrhW9zP6yYci55jS0KSiT
         S24BgSELE0nLoXXwb5IlXZBbgCQUuyUlCwX35S7o6m0rGRIxQXejfY1sttqMqWyLHeIe
         lc7CRN+BcJhhns8nakGihJhW5yh9e5ZQGoqbgLv1mDGCp6GHNJR/d5QT9EDTH88AxZkl
         P8FSSlWTfLEW7QfF26zESbGrQgi+iFCAsBOzuBZqMRNGsWw5BqEbFvMjHXAdCtk/NYDG
         9wyIaaoej/ubo+aRUHGG5qFhkIJXNCeQiToxAGARCtoPqPnen2/t+yxIpr6ayLQKe0Wv
         X2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=IVgR6UtXy284FnJ+AnltzZFquLOeO6luh0Rlhr4ZT6c=;
        b=YVExK40iMUz0Oc8nJuIpjZ4P060sux7rBTB9+9XwR/HhJDc7iz0KySwWxyJI2QAcj4
         ceDMxXlhUhKbxy+OVOR3WXDLSjxoAL0jExptoXcekwwI1kAuxH0geoFfAQQ5Tv0+OcS3
         Ty/9tkfws5YBUakElBRP5hQgcbNwP0j1McqPbm8Mprj2jeA7sd0ZlNcoKdEgP6c8B1Dp
         VWbTzEaFVuUFvU1+txKzNntymZsQUaNT+5thsSE0v04+RUG6txlUVCtobd4wUXLb+Q63
         +Ryw9jYGK3WTk+iAoDwFSqimIRmXnvoZEmJZT7br3HWAE/87dloVjlpQoqHbsHysXYuA
         jMxQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX+RordJYQiDWAIv+RaVYE1nbkxODZYI4JwK7CE74BCxnTRq6yQ
	jzuDKBc0cMb7sitDvCosS8A=
X-Google-Smtp-Source: APXvYqyZ5RdYAX+VByGV+zD9A6SkSUeEN3VrdrDawEdSNFAJ4XlxFcT+KdMJSUM8W0GHHhgLzrKW2g==
X-Received: by 2002:aca:cfc7:: with SMTP id f190mr7465308oig.158.1557936491169;
        Wed, 15 May 2019 09:08:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:160b:: with SMTP id g11ls538637otr.0.gmail; Wed, 15
 May 2019 09:08:05 -0700 (PDT)
X-Received: by 2002:a9d:3f61:: with SMTP id m88mr3055049otc.147.1557936485031;
        Wed, 15 May 2019 09:08:05 -0700 (PDT)
Date: Wed, 15 May 2019 09:08:03 -0700 (PDT)
From: =?UTF-8?Q?Hakk=C4=B1_Kurumahmut?= <hkurumahmut84@hotmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <16202b86-3435-4c30-8a8d-88ef468e3ed1@googlegroups.com>
In-Reply-To: <ab15444f-4a35-712f-3979-8b04a395ee1e@web.de>
References: <edd9ef72-beae-42c3-94c7-ac5bf29ba57d@googlegroups.com>
 <594f54f4-eb5c-5b64-2d49-38997bcf2f8b@siemens.com>
 <50b964d8-41e5-49af-96dc-3080cbd3966e@googlegroups.com>
 <62d847c0-b4b6-4395-b603-ecf2f87095d7@googlegroups.com>
 <3bcebf94-23a5-18d3-1f0b-bb25717167a3@siemens.com>
 <c238d436-5995-4c44-8a19-bc26654671d5@googlegroups.com>
 <5c94104f-c27d-9074-1990-61fa9e9d05c1@siemens.com>
 <cda9daa8-fbe8-46fb-aaba-75ebd38e141e@googlegroups.com>
 <ab15444f-4a35-712f-3979-8b04a395ee1e@web.de>
Subject: Re: Unsupported DMAR Device Scope Structure
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1746_2092991133.1557936484101"
X-Original-Sender: hkurumahmut84@hotmail.com
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

------=_Part_1746_2092991133.1557936484101
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

15 May=C4=B1s 2019 =C3=87ar=C5=9Famba 12:59:35 UTC+3 tarihinde Jan Kiszka y=
azd=C4=B1:
> On 07.05.19 23:14, Hakk=C4=B1 Kurumahmut wrote:
> > @Jan
> >
> > I have a question about the patch. assign_iommu_info and append_comment=
_info methods is running for PCI-PCI bridge primary and secondary bus,dev,f=
n.
> >
> > I'm not sure it should work for the primary bus,dev,fn.
> >
> > Example Device Scope:
> >
> > 01 0A 00 00 00 00 1C 07 00 00
> > 01 0A 00 00 00 00 1C 07 00 02
> > 01 0A 00 00 00 00 1C 07 00 04
> >
> > It is running order
> >
> > 1.) 00:1C.07
> > 2.) sec-bus:00.00
> > 3.) 00:1C.07
> > 4.) sec-bus:00.02
> > 5.) 00:1C.07
> > 6.) sec-bus:00.04
> >
> > May be it is run for only secondary buses.
> >
> > 1.) sec-bus:00.00
> > 2.) sec-bus:00.02
> > 3.) sec-bus:00.04
> >
> >

> I'm not yet sure I get the idea of your patch. Unfortunately, it mixes a
> refactoring with the enhancement of device scope parser. Why?
>=20
> I would have added this feature by simply enhancing parse_dmar_devscope. =
That
> function is just missing the hierarchy walk when a more complex scope is
> provided, basically what is described in the spec, section 8.3.1, in pseu=
docode.
> Then parse_dmar_devscope would continue to provide us (bus, dev, fn) as o=
utput,
> and no further changes to the rest would be needed.
>=20
> Jan

Hi Jan,=20

You are right. Simple patch is enough. pseudocode code only get one device.=
 My fault...

Thanks.

HAKKI

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/16202b86-3435-4c30-8a8d-88ef468e3ed1%40googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_1746_2092991133.1557936484101--
