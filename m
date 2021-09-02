Return-Path: <jailhouse-dev+bncBDGILGE54ELBBH74YKEQMGQENMGVAYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AEE3FED77
	for <lists+jailhouse-dev@lfdr.de>; Thu,  2 Sep 2021 14:05:52 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id q62-20020a2e2a41000000b001d37080f948sf593965ljq.17
        for <lists+jailhouse-dev@lfdr.de>; Thu, 02 Sep 2021 05:05:52 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1630584352; cv=pass;
        d=google.com; s=arc-20160816;
        b=qoQCJ9MQur1RSF2plMUbihIFUyNM/4KdNkLctPqiBHnoe43WXv6OdPP+HlPDcHGvVQ
         lZntdjKkdeBiy6E1Jwf8Qn0pPvUEs8vJ/B3MSQUUG8r1bISnvZD2Q5HU3pwQLiNRLiR6
         R/in2rCSwxmEGm8kehf1QtsWFbbdFib6KQGKreoBPR/TDEVoYfsZsRHH6edNtzbHZiQO
         6W5yhbhZvU02ci967/moIDeHE0baJWHYLxECi0gj6sgXswP6r78MzDzViUSqvLI29Neh
         dSZwIdGxqCFF1pSHqAPVK4mSULT+BXceVlAEgcVXBbGUpEOtP+k+ACJLe3oHZsrSpJhj
         pdMA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=m0hT/5YPThsDjvvjR1no1o9fAgK9rDRi9wSWZ+zplCI=;
        b=hKj5bpQEtAsLiKosEejBsuJdop7iOwR8tjccoXs4knn+xybbCbrHdXhr+0mZq6QPZa
         2ICCZQAaWjYbBggh9r7SqVxohmJ90BvFusWX+KJge+RsWfyEkdgXx63YpSQfCKm67C0+
         O/l4YyzwHSrzTO45n/LylpEXLhECyTO2h5g4lQNJPV3nli/qqgD5ZdvbxGtdNfee8Rof
         ZVj2B1ptSgRcYMY5XWEKnl2pLsgFW9RLjBCpRYtaNQkaIMa9yohfk5c0YAgb2F6otCAN
         SMQncocmWXKLDvWpM3vmS9t8RC2dLdwpwYxE+h6yUexx4SbfT329vAaE9nN5BD9iEumc
         qoDA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=D1udM4EY;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.7.100 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=m0hT/5YPThsDjvvjR1no1o9fAgK9rDRi9wSWZ+zplCI=;
        b=g1RvgT6O6iqKPJ03ntwynfvPHfH5BA5luxR6BlzAILEMUg4DrUV7nzj51Xlu9ESMcr
         sZM9Q87BqXJ8uyDZu30xkkr28DLTJsk+iytXfpeYutQ+tvdbF4l87MPD5Pts5LSvnEeE
         m+LeIiII3opLpoTPdWHkmmHikcbfCDTBfyib7Q3tgt/hhNdH1bBqHonkVfXZJOSmlWj+
         cV92P/esriNiTJ07TZCNZe39qxbua/9yxzTqdFGGWvCVQb5se353+9O5KYsfSSEkxQ+3
         YmL9+eXzPL9FcFqd/HWuxhZ9PI8C7tnYhNKXX9jC0UXPjK4kMia8r3d/tjvK5VwBHRE9
         9pwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=m0hT/5YPThsDjvvjR1no1o9fAgK9rDRi9wSWZ+zplCI=;
        b=j2KPvRzCDmCJLHIkRnVH9rDYc/VxW9ZArfFkbOafG+CO8fEjdH8ufhJEW8Kb3tknzZ
         Y3jWHxshgqrAKK7ogV1gCyLpmzOm08pB6roUq7OHycFzQDh8yg6hFELmsnA4GrT4qWdf
         WCBN2a2ZrX6/SZaWw6sEC/M7nMuql8qR+WJiLGfZp0NrxJfL+6/U7LtnxqYDq+yZkI4L
         xf1GPSx9UkK+LOVfW9jstGSH/yKfqm/sTNM57xmcE59hXpBOIGQnKphdkzjE592qxFkh
         BkG10Q5zIwYxbQa8gKCbodtNrs+TtrMC+Bfpt60pf88xi+xWJA8ttALZH0hOJfiniKtl
         +eow==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53156XnCQNJ51f+dNuFz/d1x6m8R4IVZHw5yILiYWtHVElt7ayKq
	0uj10ancQA0UMTpdihMDUTs=
X-Google-Smtp-Source: ABdhPJzNPUY61/avrnVRPs+K3Y5ofqv9uzeSL6vszXclpyyCIleY5IkCL3ZpuhmTA9053bvsjXbUvg==
X-Received: by 2002:a2e:8798:: with SMTP id n24mr2227340lji.469.1630584351687;
        Thu, 02 Sep 2021 05:05:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:10e:: with SMTP id a14ls378117ljb.4.gmail; Thu, 02
 Sep 2021 05:05:50 -0700 (PDT)
X-Received: by 2002:a2e:a26c:: with SMTP id k12mr2194910ljm.17.1630584350349;
        Thu, 02 Sep 2021 05:05:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1630584350; cv=pass;
        d=google.com; s=arc-20160816;
        b=D9GsZD7/iGZs11yIXUrRqpwEgHY401XUchgqaprOwqJhgXubpDS1jJw+N6VaPQXsOX
         FrroONRH4ETNxR2Iz0TFvw08kfhWfzTAJxkMJghVEOpx7wa4fohNEHBtOVdx4U/YCGgt
         1gL+YzTcTBpE97r8AGZ9fwOMDdP7/NrIvCC3ZwBYXT0HdIKhABF+8ze1vanscThsJgeP
         Th01IuXJr88u6S90KW9bT2DSJflHStkRFrb1YMAAZqblaFKNLwpaQGg9jBYvvHa/8KxK
         Me/tSUjDnDbMcDfDrLOQQRSUw/i1Yer4CnjJUofyt/j4sb9tlbKVQO1+KsWNzu61f+c2
         tC6A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=OuGk9yk5lJg2upiGXMpW/Zo+Ij1A8oXX5KLKAJjlu84=;
        b=ld3lGGor/NgSjGzhpWPhiZSm96QUZj1FWYIBX7OpBXaDiRp6DztF4JCeB/nDPqo6lJ
         gtVTbIvjH4UDyn8lYRlbV3IqT2f+bPaG4apKW0w0xIJEvSIVFxeX4lRS4ZPOgcuWuR1G
         EOrlZFyy7b0bnvUpfBo10b7YaJtGP5LWSxm7Y8QsAo1/N3prEVP1yqO2bTlRSi/iD4t6
         FNNe1uGYPuEafbRY4SEAXNcoQw1ali7G+tt3TeeAyT0Kta7ioXr3p/0KI4vfCd41gzH5
         0lYdWxhPcziB7NP0tq6ef68O4v1rPys88pfL3AIahyljz1HNvmxeWbjinKVEw+vV2DN9
         EocA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=D1udM4EY;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.7.100 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70100.outbound.protection.outlook.com. [40.107.7.100])
        by gmr-mx.google.com with ESMTPS id z21si65799ljn.1.2021.09.02.05.05.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Sep 2021 05:05:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.7.100 as permitted sender) client-ip=40.107.7.100;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FaShMCaxDR906JIgDpdKAVVgyh+FgnMbuZCVkUQvfm5rgmPQcbLKMN3MSd0zb8E5kxi4NA9i9Xq3ATSide9Ih+gP1XxLpWCQslrhdsFkp0S7pVKNRf7fVACFHyRPJrO0ESnBFfPB1Z0DAFwdZDExOafUadG+H16+iakWPrpUVB1JhLnUTXAIPy3LiIEQ41E+FeGYFJhYaoaque9ieeFXqdWy7mJpYSyLGZmMwJHgFvkKY7nyrBsqOJqwDvledOFjG1jRZQt+1K0wNzYbL159iEPAKLWqnwJjy/WmwMJwS3NKhtRkYI/9FkT1IOnPuGQOf/7Cd+O5oZj24sdty+wRoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=OuGk9yk5lJg2upiGXMpW/Zo+Ij1A8oXX5KLKAJjlu84=;
 b=AqLF+VxAdUtAqp0TPrZnLj2qaIt0vD9BKdrtERpMHLN/1KvhcmyIJSx0SBUO9BbPysWyBTkf+0YGEBNg2/266pfqWvDceh+b7U9QClqt8huYczDLkuOIz5UrlUvhvScFr5mNwxAc0dyQSCCsn74Z6Uv8qUzOp0heEY6yoehUnkRgvEXZi1JxDyyFdra4leNXRiNOES2cxMVQEJQIVAmEkCo6g3qThxY5tSAMrsXHXn72oqAT7dykEeMT/jIgcx7KzzD2avG15BsFBhDwuMA4Rnert22hkffn33ObKt39eO2WQ0HShL83esJfima2+KrgnI9vUVjWCN/iRePMAt0ZHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com (2603:10a6:20b:257::14)
 by AS8PR02MB6789.eurprd02.prod.outlook.com (2603:10a6:20b:256::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20; Thu, 2 Sep
 2021 12:05:46 +0000
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::f949:d45b:acb4:e0fb]) by AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::f949:d45b:acb4:e0fb%4]) with mapi id 15.20.4478.022; Thu, 2 Sep 2021
 12:05:46 +0000
From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: RE: Error: FATAL: Unsupported MSI/MSI-X state, device xx:xx.x, cap 5
Thread-Topic: Error: FATAL: Unsupported MSI/MSI-X state, device xx:xx.x, cap 5
Thread-Index: AdefHQjbncc1UIsBRdqRgTxiubdggQABJdEAADQc4NA=
Date: Thu, 2 Sep 2021 12:05:45 +0000
Message-ID: <AS8PR02MB6663D82E3518A3444F3E8CBDB6CE9@AS8PR02MB6663.eurprd02.prod.outlook.com>
References: <AS8PR02MB66630A289AFD9FCF2EBFAD7EB6CD9@AS8PR02MB6663.eurprd02.prod.outlook.com>
 <3e7cea78-3cba-030a-3896-0607fda06f9e@siemens.com>
In-Reply-To: <3e7cea78-3cba-030a-3896-0607fda06f9e@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c2d871c-7e1d-42d1-aca3-08d96e09fef1
x-ms-traffictypediagnostic: AS8PR02MB6789:
x-microsoft-antispam-prvs: <AS8PR02MB678991FD955FB6B0DDDDBA24B6CE9@AS8PR02MB6789.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ptF8cDC7cZ2PN2Feec/7J9zSUpoUNvRWsp4hWYas5HGCX8otKKPrOQilsIeYH5ZTo/AcGYfNq+bBOBpPcJicI2JFcnCzLV/YSGcha22MlEbJx2C3yivkiPdS4Q9/u3NVOQhdl4s0DDtjQYNCGL9mOqxaMCO7AjyVKZvD+1XxdacDjQiIwvqIQXn3x8WUUNQVKw3pKZ5CMOJfJHjtge4ZMp7QlMoysa9QHzNm/z703pToa57shyX72b3QapQXQChhdc7BDclvJieIRGwGUPQ/72i+dCevOgTXvcg0zvV5zwO7rtDBDO4feGMBrwU1jY9GKy9vemc5gvuvE6CA5MrYe+hvfah/Ypsu3srrEEENsfKoPAiwJhSYavtd8clTo/UrHnP9jIH0pV1g7W7WoxSlta6nmFfvl1n5FIJBrAvbPRVt6+kbDf6Nn4gUlZifijpr9Nhvscidp7VYyc+tiLeOGExraZp3xbIavRwSjxme/LsHxQT9x+DRXmYkx6oPDskreU2ocVJFI1z6QgC+iVQmTiJQK0lckC4utjsJoUBkSTaKg95sr5Ek9BYdHooD658GLdbXJI458+kCy0esXSdFztdFWlRRzy/uTc7YmCPjc7aGaJnkgAPXkf1KnR1l050PsO506gpimHnBgugYiHbcm4WwnasGt5QoaSO4BfDWkjW79y6HtnQO1GEBqr2gziuhtkbbTnaxMBV0veqMchiKQZnhr7XxfFIcGLkSvjd83vyxgnofroMDysov/WKarReDNnwFRybkxYz0IfFCgGnNnTZb4bKu0W/2tqaNRIBt9mA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB6663.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(966005)(71200400001)(38070700005)(508600001)(5660300002)(2906002)(45080400002)(44832011)(6916009)(316002)(8936002)(66946007)(76116006)(86362001)(66556008)(66476007)(53546011)(6506007)(66446008)(33656002)(4326008)(26005)(64756008)(9686003)(8676002)(186003)(55016002)(38100700002)(52536014)(122000001)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2Q30r6ULtNJHA77hBVWKZIpjT41lTqxiptGZTZhIA12B4+8gL7/FdSTPzjIg?=
 =?us-ascii?Q?QRU/nhmpbRgJqya1lqu7dZsmf8U9SIwZk3KOcLbA+tdveQM3JSLX/f2MKJYn?=
 =?us-ascii?Q?pN4B3pI6VPKJgMWth54CDnjAFJW/aEspPDUlOMNhAvgcLEcUYeUCZ3hJnmTw?=
 =?us-ascii?Q?3QdZamZ2ryVfmFTexW5zfHCkWCJyf2dvE53tIi164splBO1z2taJiBSocOJW?=
 =?us-ascii?Q?gEhoqguqCFuM+yUT+6WGc/nUkgQ4njlpZCq+I9KbZWvmMtuEaundxHHQJwq6?=
 =?us-ascii?Q?1onzSYTaEGpLtjxmPXHKfEaaLKvjPUdTJS6sqoUffQIaHUb4IJhVLtAV5aPE?=
 =?us-ascii?Q?UOlfAeRF8SJNO7IwGIGkxGFklPHs5399m0lmkKiCbzhp1CryLXWBagPoGsJc?=
 =?us-ascii?Q?D0QZsPJNRZJNB+ZQ/ydJVCriMoyF4ueVJCG9KTmPy/8qAMKOaNtEK8hWAlkQ?=
 =?us-ascii?Q?DfP6ph5+bnqOBEvb2/1rCBiFr26hJ5V1/j0usslR1J8At0mY8au1zWKqETAe?=
 =?us-ascii?Q?ONMPIJDISFa7VpxBDTQjRvSt+TyqKH8CSdSOjV35oMs9LlSY+dB3AVerMFqz?=
 =?us-ascii?Q?2z6jBC9B3FDHxb2Gfz+5d5fa3HvW2s37aOB/8WBfAtSoL5eQ3zo2wYRMrgS5?=
 =?us-ascii?Q?arM/syz0AObmoQpFtie3oVbCLck6UAyIfsi2lQQZprh9b6vMkwRs4MRZcSAs?=
 =?us-ascii?Q?bVTktKHjiWk5kLIc4i3+hV1cOu4Lq0Z0iHxivxA1/h5kTrblIo9EY9bKqXFs?=
 =?us-ascii?Q?4VRjpQWDstaycps21CFbGdq3s6fncugVV9bW7N0ADLjxJm5HjuvhMue9XQOr?=
 =?us-ascii?Q?OibHJAcJ2/jN1I3ReJMziw2OW2KiWl0pQ1pTo8Wgu9krjN9TyfTpMaiYcRAC?=
 =?us-ascii?Q?+cIuiDewjR1jX6XS043PTkmePrb+3B8X7PBOJeLBwNUUryNpWW1ful4e8ZmO?=
 =?us-ascii?Q?Ls7iAGDC01uRIOh4Qx/1KQLU/HY0oasz29aVMDLQgPGz6XciSZVGm5AeBP+0?=
 =?us-ascii?Q?J3z6kkEc+LVpGI1Rw3UY+nN+SwsnduaR5Pkd7qhbsqMDO729VM4ENT6HmUS2?=
 =?us-ascii?Q?U8chEwAj7sbipSJ90a0hhMLnMBjFUYmxWhB/RVHPLKlp8wdx31VLgi7CS2Xl?=
 =?us-ascii?Q?qftg6x6Z/P/+QGf6WViweRXukilGO2me3IcIgsnSoh6M+skRHDzxfRcCsqLb?=
 =?us-ascii?Q?yXdnBowC1WvBiVm9l6YVhcKSodYj0zjz0YENbDKubteLzngsZTK3VtH94L9L?=
 =?us-ascii?Q?YgcfE1MfXRysNt88GUHk4MTh5EL3Hk970GLBlPr3lwLHXF5RDyu5qZtuJ7MC?=
 =?us-ascii?Q?9VnlSazClFebWIlQ6N2o2jdx?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB6663.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c2d871c-7e1d-42d1-aca3-08d96e09fef1
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2021 12:05:45.9164
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f2glm2PIHY8S8psQTJyjdvMJJ8lpQ3/1hyewxJEnG1DbMb8uvopuPKKCrl0TjBMXGmj0Esa4/izG2vvZkKhdW5rAMNvig4dikCKcvYsvowHLAfzlCjQ5RvLtF5BRCsrmkZ6wXbWQx9cr5a06CDiKHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB6789
X-Original-Sender: bram.hooimeijer@prodrive-technologies.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@prodrive-technologies.com header.s=selector1 header.b=D1udM4EY;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass
 dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com
 designates 40.107.7.100 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
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

> 
> On 01.09.21 13:01, Bram Hooimeijer wrote:
> > Dear Jailhouse community,
> >
> > Currently I am running into an issue enabling Jailhouse on a x86-based
> > server platform.
> >
> > The error triggered is
> > FATAL: Unsupported MSI/MSI-X state, device xx:xx.x, cap 5 from
> > hypervisor/pci.c, line 833.
> >
> > This is traced back via
> > hypervisor/pci.c:             pci_config_commit
> > hypervisor/arch/x86/pci.c:    arch_pci_update_msi
> > hypervisor/arch/x86/vtd.c:    iommu_map_interrupt
> >
> > where the check irte.field.sid != device_id fails.
> >
> > The device for which this fails is a PCI bridge. The check fails for
> > vector 8 sid  0x5F40 device_id 0x5E00
> >
> > The device_id corresponds to the upstream switch port, the sid
> > corresponds to the downstream switch port. See the sysconfig snippet
> below.
> >
> > The sysconfig discovers 8 msi_vectors for the upstream port, so this
> > failing at vector 8 makes quite some sense. However, the value of
> > vectors in arch_pci_update_msi is 128! I.e, tries to access up to 128
> > vector, which seems much too high. This value comes from union
> > pci_msi_registers. Could that be misconfigured in the case of a bridge?
> >
> > Does anybody have an idea what goes wrong here?
> > Is this on the Jailhouse side, or is the switch misconfigured?
> >
> > PS, Removing the bridges fixes the error.
> >
> > Thanks for the support!
> >
> > Best regards, Bram Hooimeijer
> >
> >     /* PCIDevice: 5e:00.0: Upstream port*/
> >     {
> >             .type = JAILHOUSE_PCI_TYPE_BRIDGE,
> >             .iommu = 6,
> >             .domain = 0x0,
> >             .bdf = 0x5e00,
> >             .bar_mask = {
> >                     0xfffc0000, 0x00000000, 0x00000000,
> >                     0x00000000, 0x00000000, 0x00000000,
> >             },
> >             .caps_start = 80,
> >             .num_caps = 12,
> >             .num_msi_vectors = 8,
> >             .msi_64bits = 1,
> >             .msi_maskable = 1,
> >             .num_msix_vectors = 0,
> >             .msix_region_size = 0x0,
> >             .msix_address = 0x0,
> >     },
> >     /* PCIDevice: 5f:08.0 Downstream port*/
> >     {
> >             .type = JAILHOUSE_PCI_TYPE_BRIDGE,
> >             .iommu = 6,
> >             .domain = 0x0,
> >             .bdf = 0x5f40,
> >             .bar_mask = {
> >                     0x00000000, 0x00000000, 0x00000000,
> >                     0x00000000, 0x00000000, 0x00000000,
> >             },
> >             .caps_start = 92,
> >             .num_caps = 12,
> >             .num_msi_vectors = 8,
> >             .msi_64bits = 1,
> >             .msi_maskable = 1,
> >             .num_msix_vectors = 0,
> >             .msix_region_size = 0x0,
> >             .msix_address = 0x0,
> >     },
> >     /* PCIDevice: 5f:10.0 Downstream port */
> >     {
> >             .type = JAILHOUSE_PCI_TYPE_BRIDGE,
> >             .iommu = 6,
> >             .domain = 0x0,
> >             .bdf = 0x5f80,
> >             .bar_mask = {
> >                     0x00000000, 0x00000000, 0x00000000,
> >                     0x00000000, 0x00000000, 0x00000000,
> >             },
> >             .caps_start = 92,
> >             .num_caps = 12,
> >             .num_msi_vectors = 8,
> >             .msi_64bits = 1,
> >             .msi_maskable = 1,
> >             .num_msix_vectors = 0,
> >             .msix_region_size = 0x0,
> >             .msix_address = 0x0,
> >     },
> >
> 
> Does
> https://eur03.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.k
> ernel.org%2Flkml%2F8f9a13ac-8ab1-15ac-06cb-
> c131b488a36f%40siemens.com%2F&amp;data=04%7C01%7Cbram.hooimeije
> r%40prodrive-
> technologies.com%7C7a6eb63aa1f94852295408d96d38c3ba%7C612607c95af7
> 4e7f8976faf1ae77be60%7C0%7C0%7C637660912838053763%7CUnknown%7C
> TWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL
> CJXVCI6Mn0%3D%7C1000&amp;sdata=hwugs%2FxFhCwV1oHsSNINb7kQxk
> HYxZKezqe2%2F9nJDWo%3D&amp;reserved=0
> happen to help in this case as well? Just crafted it recently after seeing
> spurious MSIs on enable.

I see, we will patch the kernel and try again at some point. For now we just removed
the switches. Will report back if I know more, but this already serves some future 
troubleshooters. 

Thanks for the quick reply!

Best, Bram
> 
> Jan
> 
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AS8PR02MB6663D82E3518A3444F3E8CBDB6CE9%40AS8PR02MB6663.eurprd02.prod.outlook.com.
