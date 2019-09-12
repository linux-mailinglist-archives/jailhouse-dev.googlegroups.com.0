Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBI7C5DVQKGQEOWGC4SQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 8612BB0E47
	for <lists+jailhouse-dev@lfdr.de>; Thu, 12 Sep 2019 13:51:00 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id 34sf14624953edf.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 12 Sep 2019 04:51:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1568289060; cv=pass;
        d=google.com; s=arc-20160816;
        b=fKyHHi+5ZD++nGtslbZlg/hqpmuEqQJt0LqnlCakcwm/eRHYcrfj3Kt22vdwqmBS4e
         rwCwKH8hE9RgYLKl8MuKuskBYm9AoTEBYJC9/K1zoTgqArvlgiqCBSLmEacPYV6MRReA
         PsDX/lCs2qAPmgJQ9dBxVTxRyP0U2qOdpcZisPXAUznEHhK110kv+cm1w9C3ELy8/Ese
         t0jn1E6RMrt17uhRmXPJ0LNGEV1gIVd13RG/o6lC+6F/oYCmA6YE66oZG6IEYZBNKX8y
         N8wqYiya+WAdwO75tlhOVOyUoSqe+cKAe0B0dDtZueOeYxAuKfpykH1aNpFPDeQm9azM
         WcMg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=Oeap3kP9hirvdZT2b/aCTaE+1qUfvPEApOpPIYJauGI=;
        b=o9UC6Mssx8Tzo4jQuFv60ssa8FK5Vb+A9oeD4x+7i3lzz0lzhKM2Pc2ITM7bZgkLHT
         Yq0ERb6AWIaxShJ1XF0NCrR06XIFXf/9+hbtO1cxvquJhKqE3by/YeYwPu2JpHSURT+x
         C+0ut1MmmzbbquxjynVlMAsZ75LjI+tTvdmSvGINJPBa4Zem5AfMKzQOJn9lfhF49wkh
         mseC3z0rupz5kKWlpQaGwSxjYf7ouRJyKwlCm46oMGzLyezPKox/Zf5Dta1coypYq+vW
         3cxYiBestQeiLKGLC6ebVHgiAcvEvRhVPc6HAScrYqjy0q9Wex+UDqCNxjaUj0j8I57b
         o3fQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Oeap3kP9hirvdZT2b/aCTaE+1qUfvPEApOpPIYJauGI=;
        b=WTRAIPQ0e65lTFbL4qVE8Sj5OY1st29Rt0Qk/lDMffISdpI4CgcbBwau0iExZFmucP
         oKIOaXyLiE9Qu0fOY2Dbeub0Usy4WHPXr2gVp8izpRqVg00zCRXD6fzlH32PcKOrV9h3
         mnfanFMn+tm6Gzs670W22+nh7kEWNpbT+PLVh4RPrbywfoTnFrtsK/sQD/HkCL52Gjkl
         zSa0+qYja25bca1GttY+tc9u2AnKWPpW+m/QXf8k9jfOUPZS/s+UnfLc/WFSRZQhW34w
         qpRyr2BWBApJBPpAE7c0xfqu0AlwhzyD0lzi8mElf/2bP+RyN70ycnv5Ra7/d9wFM3JZ
         AX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Oeap3kP9hirvdZT2b/aCTaE+1qUfvPEApOpPIYJauGI=;
        b=l3yXNi3REb/o+GHewxWiOnX8QWzY7Im7JZ0gIKJ9r75CYZ+ilopxKQ4hfjt3nlwbtL
         ixJSb95/Obprp6M36lwVjuSHmaf7xKKWE431TmRzMR3e9oAvW/Kk/i0NmbMmzb1eANwD
         fAewTP9XOB2RdaJ+jZ9YarXDxXmad6dgXq6Leo568AcSTrcutjD55eaBh8xikIOB2p3p
         vB6s49brFlIrRgxTeUK1Lyl+yd9yx6ce7qq6sxAgrr/cydq6y8PgPlrCFdigXwLvbAbf
         MT6UAsLm9eKzm8v+miMdRp6sd8uqCHj+R4XJnPoA68zdM2F0wHh6pqfsd0UWPHmPZTPA
         g2BA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU/R/t3QEWAABaORW7Jy/BiAhS611HULmhfB3Mf/2RzDhi4LBWJ
	1YQTMzsmPjTUTUMV5hXgG10=
X-Google-Smtp-Source: APXvYqxtCK6cGNnDp32MSKDSfHowtCzhBlFOad7ownhgOzcXniPK6RJyrA9XRZ0xEJI2soojgjxOKQ==
X-Received: by 2002:a17:906:a3d1:: with SMTP id ca17mr3520238ejb.57.1568289060215;
        Thu, 12 Sep 2019 04:51:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:da85:: with SMTP id q5ls6411710eds.15.gmail; Thu, 12 Sep
 2019 04:50:59 -0700 (PDT)
X-Received: by 2002:a50:ee08:: with SMTP id g8mr41360914eds.261.1568289059458;
        Thu, 12 Sep 2019 04:50:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568289059; cv=none;
        d=google.com; s=arc-20160816;
        b=CguroXXuEw/tyj3A0RmN88q5ouIgvJg2Fh6t6g8HkZB+Pt69OM3JrvrLFFsZzHSB84
         hs0TfLo66DatfGTNWNvNENHHU3vr1NFETi34aOnVOCKhdSHGTjqXUR7BJPGIeujIUvwk
         mNOVqjzOP+PIw6U+yigArL+UkoFu4P4GiNtjlJPcaNhqO1ibvObQSlzI2K7ZTnBG1ArX
         LtD75lkfFx4dG7TGIc1rdnUitolj0Gl5f7N1TJt/5hVWTsQSnQp8BlqkrKNJ/+po5WDk
         1MWIt73ShEICrIey9BVkuJi21lijfVtOLq7Ny6SssUjTgkPgomAXcDHNKUSk9t7dou59
         JhXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=cv2r9fjqNgmemon5KrrfF9wq5GMGFKGtbEuccWHyiLY=;
        b=GAcAr/0MqibtHDPSVSOjpkCVy90dKqWqqmkgTEejJ+ktUt6pbq8cB2kpEuAm3hXmi+
         yKjf4zrar3dQO/Cs0xU6ug5DR9BR1HT9lR854TanxY0TFZRMX7zqHHWZY5l6YH67G18h
         Hlusnn4d6POXsRsER0GcFLB+qafZpdQ45IaM+a7qjgYNuWJU4VZ/uyKum2ojmvPJzv7F
         ut2/Rka/Q77aOXopaE5WDBOkryJC23wb1ALuGYXAalrJ7dNZXfgnmaPzUQpHCzmjof62
         +wckXStrGQbVlpu0mEyPren2hY6NqNH/tMGtbbM7SQpga87dIXWmTpAOVTcryCYc9Ebm
         nVWw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id d14si1472977edb.4.2019.09.12.04.50.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Sep 2019 04:50:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x8CBowB9029973
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Sep 2019 13:50:58 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x8CBowIN024822;
	Thu, 12 Sep 2019 13:50:58 +0200
Subject: Re: GIC demo on ZCU102 using Xilinx 2019.1
To: Peter Smith <salerio@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <50509467-1cc3-4532-be45-5fbb44138efb@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <f6cdd509-50d4-db9b-f777-d09c93a48212@siemens.com>
Date: Thu, 12 Sep 2019 13:50:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <50509467-1cc3-4532-be45-5fbb44138efb@googlegroups.com>
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

On 12.09.19 11:19, Peter Smith wrote:
> Hi,
>=20
> Being a first time jailhouse person I just wanted to ask if the error sho=
wn=20
> below (see affinity error) is expected or is indicating some form of prob=
lem / bug,
>=20
> jailhouse cell create zynqmp-zcu102-gic-demo.cell
> [=C2=A0 234.513438] IRQ56: set affinity failed(-22).
> [=C2=A0 234.513546] CPU3: shutdown
> [=C2=A0 234.520525] psci: CPU3 killed.
> Created cell "gic-demo"
>=20
> The environment was created using Xilinx's 2019.1 meta-xilinx-bsp layer (=
4.19=20
> kernel) and the contents of the master branch of jailhouse from Github.
>=20
> The gic demo works fine but I did need to keep the second UART awake (cat=
 >=20
> /dev/ttoPS1 &) to see the output.

Might be related to=20
https://groups.google.com/d/msgid/jailhouse-dev/7297AC93-068F-4C6F-8486-222=
D62F7D1EB%40gmx.de.

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
jailhouse-dev/f6cdd509-50d4-db9b-f777-d09c93a48212%40siemens.com.
