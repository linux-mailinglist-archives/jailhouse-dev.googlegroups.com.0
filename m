Return-Path: <jailhouse-dev+bncBCZ3TK6ASEDBB6UO3HTQKGQESRHWQ2A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 892D23445A
	for <lists+jailhouse-dev@lfdr.de>; Tue,  4 Jun 2019 12:27:07 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id 9sf1218839ljv.14
        for <lists+jailhouse-dev@lfdr.de>; Tue, 04 Jun 2019 03:27:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559644027; cv=pass;
        d=google.com; s=arc-20160816;
        b=rycOWJad20lTjgrqBiiA7rt6tHyqp2fXqRw54jMaa9PvIGiBl5+M9UvNeJIqP/uTA+
         JYfLLijy4uNVq4xj24sgK8TvKE7tTaZU3a2Mf4JkXFAgg9kvu3xenxaOE4DpRs930EIR
         fPnqB28d1cQx4M3tHzybL0SMgWeUrYy/cXgAwllhZkk79K4tjrMobCrqN7RPcqrM/nIh
         3Bz/gwxWYp88E1YcTXcIy7EGNiqSV5rEgrs162l5UbdiY3+6PqGVRM89hzP1k4cQsqPc
         yDgkJab3430D6Apqy3aIsxKem9RyXW24EJ7N2kIhCW3DFd5keUaY7dA74G5mSFAy1UDJ
         8mOA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=eIByvqECE/B4K+0+v9TUP2f7L4oTrbfkMbXGEq7L9vk=;
        b=liIJJJI2T4h/txBNDVRzXWVtLNpd/CnL9BLhETAkR+f+ybtEqpuCubAZykkxNs2mBL
         TrT9P3lNQL8/oiNAFfLV1pvKv1Pd0M+/gevAFdTY5Qwt2Cnnkmq3FA6BJFX7YkufNQB7
         K7jPoakI+Xo2kQ30PvaiUHyzg3f8oWmA7RHQrxlcnGaqhNKPGFrr6omjeSI7pz7MtSZ8
         KURGbYp25dlKb7E1nRVlJGFoHsjWX3oVKlH/ee4j/C0F7SwHr0gOzn8ZJ/xbVKJPMEMG
         i0oaLpj/Z1Eudwx6btKDtjjGzmP5VRu93FeSvAqOubKL+Do2WogGAGMrhdGTpkIUio+l
         ME5w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of johann.pfefferl@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=johann.pfefferl@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent:x-original-sender
         :x-original-authentication-results:content-transfer-encoding
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=eIByvqECE/B4K+0+v9TUP2f7L4oTrbfkMbXGEq7L9vk=;
        b=qXktWkzKyzwvK2nEIgPzliqVWO+m2XoiyFZ96wHSytYXc5TjmuiqDWaAGGajufzjxt
         9RJvdofYU8OLSzb7vH8KJTs022uiacB4ozyCbcOtSTRevvXur4e5gCiCgMqxb/XUpk11
         N+IUD//mwCHEcLSHb1ZcHFYhujZq+X9gaZQjnS+9H03egSUL3g7sOD5W1dK7NxAmoVrp
         XsbekqrksSrlWbWwteoesNCL5HHcwc4mJwaMVhYIxkGQLMyykl2hQW6L2S8a7kY53pMp
         KJNbO1YumCMSRDvzKoUGQ09DXvEWooDQy6CJ2BkPXoZe+K7to8DpIrZzZ9sJLYf5375M
         l+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent
         :x-original-sender:x-original-authentication-results
         :content-transfer-encoding:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=eIByvqECE/B4K+0+v9TUP2f7L4oTrbfkMbXGEq7L9vk=;
        b=Mio3F24F3wGubpXx5h8RzcxjFq03QtsdlPjwz530CpjhVnHGTSQtVeFvzq+sWDQyjN
         cwqDUvylmPf9KgobLqEa9yQUscXOZRnw7lLw68kaxs+IoZnbj8mnF7xNmkMmlaRTddmm
         xsums1r1t202PWll73IRYM3oVc+kPtRuV9BeAFL5OWZeodmN1XzG3tJtxMMsNFvEYx/m
         nAhXlJ3AHeRvXOMpjFN9LtDPvXZ0ahzVuKfN8cCEHbZ2DizYRExC4KQMrVMFNftiEqx3
         gqERCwC5iDuVr1Pa3eY4qku0zYKFLHVKJ+5wrWvGFbeL1qEh1ZfTHEtPLbpuQZ/esYMm
         Nqjg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWEv9xP/3eDQFgYu6HM5ocMLYCCLtrA9RxZy3zdsCZa4+WX4OEJ
	NLhoBxVPHqLfz1fhKjGfbkQ=
X-Google-Smtp-Source: APXvYqxW/frwDEda6Hm/rytRXkLGRDrUEH/fn67AMuP6R+yP9HHZFXQ58fWRc/9PQYXo5y7ccAOnXw==
X-Received: by 2002:a2e:b0e2:: with SMTP id h2mr8958333ljl.174.1559644027033;
        Tue, 04 Jun 2019 03:27:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4212:: with SMTP id y18ls1932649lfh.0.gmail; Tue, 04 Jun
 2019 03:27:06 -0700 (PDT)
X-Received: by 2002:ac2:4252:: with SMTP id m18mr15967678lfl.100.1559644026443;
        Tue, 04 Jun 2019 03:27:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559644026; cv=none;
        d=google.com; s=arc-20160816;
        b=AvLhG2BItg1QdQONIjeAEZHqut5VA+n5m6VTenBwOMiU0IYUSYog8Rnbgwd02vSjAd
         ad4FBRermFJPJWO0emi9hvF6K30ncIrdqBlJKsNCfBZbekb9zcEfUEGG/ji0sapt+Vum
         sdTLPC+pHNU7tKJA68rCW7lkZBypu41Ep3kT1/cdtqveIYbQsbOeNELX0qRuIivammXQ
         P2xhyffjv6kjSUAG31zNNvWqpYEAuqXy3pPC8G/3DgqwsbGqlCnGMAivaJcKU7HOQcSY
         AUnZJlRYPVVmdFuQpyHTkcHuAFroorYbYSA7eyReJXMkwux6yjNp/0f3dqFCsX2Zarha
         G5Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=d3fU55Ncd1AldoktooHACyQhcFHfk5XToKBc0NZ73Rs=;
        b=JZ8ZnQTJAzIwBYNC08XJZIK7vSYcBI+uYEBzSYVab34nLecd/1y3f7biXXOZdZl8qx
         inshA6N+ZGSDGYnn82DkUHbNKNIDrSKfXReJzy/pYW5VVsDmamrgD1RiuLiyV42ekyRE
         yPasKB7ax52j/CqcNaKhUc1U0U4IJR3vh1VKKC/zAehOJVgOXwnHh/Db+iU8osJ+35UG
         LaUK+Ud+Fgwz+ZIfx6hPBHrRnk89/hczqdpjeFPz8BrhYBlBd+B5G9i5n0mmcY5OudEY
         AkApE/WMXHe6GkJf7qmB5mNPwHiunEOCnD+NNQa9eTTBl8lKycGX5IHNhp4kYe+4p4lg
         2JQA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of johann.pfefferl@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=johann.pfefferl@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id a20si930796ljb.3.2019.06.04.03.27.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jun 2019 03:27:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of johann.pfefferl@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x54AR4wI010867
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Jun 2019 12:27:04 +0200
Received: from jpc.jpnet (DEMCHP-JPPJ.ppmd.siemens.net [139.25.69.224])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id x54AR4LO025278
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 4 Jun 2019 12:27:04 +0200
Received: by jpc.jpnet (Postfix, from userid 1223)
	id 61F7A1B201CB; Tue,  4 Jun 2019 12:27:04 +0200 (CEST)
Date: Tue, 4 Jun 2019 12:27:04 +0200
From: "Dr. Johann Pfefferl" <johann.pfefferl@siemens.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: johannesmaisch95@gmail.com, Jailhouse <jailhouse-dev@googlegroups.com>,
        Johann Pfefferl <johann.pfefferl@siemens.com>
Subject: Re: Freertos-demo bare-metal boot
Message-ID: <20190604102704.7xy42j25eq2h67rq@jpc.jpnet>
References: <f8c8bb48-ac7a-4bd2-a554-0f42a31fa5b6@googlegroups.com>
 <90eb1048-d5b5-7dcd-fa9c-ff9b715bd97b@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <90eb1048-d5b5-7dcd-fa9c-ff9b715bd97b@siemens.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Original-Sender: johann.pfefferl@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of johann.pfefferl@siemens.com designates 192.35.17.2 as
 permitted sender) smtp.mailfrom=johann.pfefferl@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Content-Transfer-Encoding: quoted-printable
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

Hello,

the start address can be adapted in the linker script file
"lscript.lds".

The UART is initialized completely by FreeRTOS itself including the
clock gating (hopefully).

Hans

Jan Kiszka <jan.kiszka@siemens.com> wrote:
> On 04.06.19 11:09, johannesmaisch95@gmail.com wrote:
> > Hello,
> >=20
> > we want to do a comparison of running FreeRTOS on the Banana Pi with Ja=
ilhouse and running FreeRTOS bare-metal on the Banana Pi for a study-projec=
t at Hochschule Esslingen. We were successfull in doing this with the Jailh=
ouse hypervisor, but we currently didn't find a way to boot FreeRTOS bare-m=
etal on the banana pi. So our question is, if there's a way to boot the fre=
ertos-demo.bin from the freertos-cell bare-metal on the banana pi.
> >=20
>=20
> Conceptually, you need to make the demo executable at a different physica=
l
> address (it's configured to run from address 0, but RAM starts at 0x40000=
000
> on the board), and then you could load it there via u-boot and jump to it=
.
> You also have to ensure that the demo configures its uart itself and does=
n't
> rely on the root cell to do anything. I don't recall if that is already t=
he
> case. Hans may tell more about that.
>=20
> Jan
>=20
> --=20
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux

--=20
Siemens AG
Corporate Technology
Research & Technology Center
CT RDA IOT SES-DE
Otto-Hahn-Ring 6
81739 Muenchen, Germany
mailto: johann.pfefferl@siemens.com
phone: +49 1520 3450 138
fax:   +49 89 636 33045
_____________________________________________________
SIEMENS AG: Chairman of the Supervisory Board: Jim Hagemann Snabe
Managing Board: Joe Kaeser, Chairman, President and Chief Executive Officer
Roland Busch, Lisa Davis, Klaus Helmrich, Janina Kugel, Cedrik Neike,
Michael Sen, Ralf P. Thomas
Registered offices: Berlin and Munich, Germany
Commercial registries: Berlin Charlottenburg, HRB 12300, Munich, HRB 6684
WEEE-Reg.-No. DE 23691322

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20190604102704.7xy42j25eq2h67rq%40jpc.jpnet.
For more options, visit https://groups.google.com/d/optout.
