Return-Path: <jailhouse-dev+bncBAABBF7CTKGQMGQEMLLK6IY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x838.google.com (mail-qt1-x838.google.com [IPv6:2607:f8b0:4864:20::838])
	by mail.lfdr.de (Postfix) with ESMTPS id 0444046422A
	for <lists+jailhouse-dev@lfdr.de>; Wed,  1 Dec 2021 00:17:45 +0100 (CET)
Received: by mail-qt1-x838.google.com with SMTP id s8-20020ac85cc8000000b002b631ea95d4sf3286240qta.4
        for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Nov 2021 15:17:44 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1638314264; cv=pass;
        d=google.com; s=arc-20160816;
        b=0Xx+hiN7xgzlOk5pgqwbgVaADLf7Uh1J5YE5Z8korPhJ9P6XcKviFe0GSWoA6IuxfJ
         l4Hrb9//ETQUlu/MHzYqRfYP7XYpgCeBH6GBl9grDImGH3UQ3RHFaghgK7KSEdM4+Aas
         6l8PFsiMGP+Nw8Q0/PQdRprGEkoEojOemg0PtdOb4S0DfxYTmtgKusM0p1YO2yibc4Uy
         tUEg+FQ134yOuKAWUlRy5GO6AOyOahOtMqlBKTPnr2RL0KoCZpO/DZVLog6tWd5cxLgk
         fEeig0xo6ahRBMiXshwf2KOJjxH8ETuvqTU/WE3MOpDWV9eT+rd7sFZTBf/TiLZM4u/c
         LvNQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :suggested_attachment_session_id:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:sender:dkim-signature;
        bh=4cEXxt7sEZ3JLfqbqmu7ZmDIxOEnpVkqYVvzz7r1OUY=;
        b=Tqb+LyILjUJAY1Z8S+T1juxx9MOFzy+/6BxDsYv3uTyQBKNiMfd4f+UHnV20Rk54Zr
         OWnUIJrxlUTNEm2FwuKs38RUQSFGeSdxoNrV9il20NuNGqr/lK9qS8CGX7TOt2+K9NcN
         xBjs138UUbGIunq2Xb7iWu8gAxNyDDtT18vgMr5YNMhTJIAQQchkV3A/1lrrCKJihTQ0
         f8p41L+Z/vNHimd2A6HoSdEfE8tgMe3cfBMcuWH5Sq3/lBcVT+gdID3Jy9ukSKF+U5tZ
         prxUNCz6KYo2Qog/CZJqR4Bf/Rr1iwj66Ie8iFu1Xqe2Mq/7HdYxlop89tt1MSEbwNW/
         coZw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=XdgZZCqZ;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of stephane.viau@oss.nxp.com designates 40.107.3.60 as permitted sender) smtp.mailfrom=stephane.viau@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :suggested_attachment_session_id:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=4cEXxt7sEZ3JLfqbqmu7ZmDIxOEnpVkqYVvzz7r1OUY=;
        b=bvHu1UFwAzTrwqGiWj7Zf1H1yppc7pywzSREBJhI3ec7fSmGALcxgumREE2v7mTNyh
         c0zTSH7p8bxPSqqRJ0bFl1Xogmz98lob2bmoU+Cjsj7UB6MO9EFD2Kxi5yiExk2vwIJp
         zed6GJQqM4juZAq+neKPIffiXyL2OiXfdtzqcx/cSeF4bZ0j/WWafImTa2fr6ydwVW9+
         wXu4BDU0MsHs+WVrKzrCj5IQQb+YtrvQwDF3aZUUIcNpTmhwcxNuRlcBsQpPlWdVdOU9
         0P1SzkkuLuhMxWTCC9pWMuHnmp4O5M2Hb6sScGvN/YKK0EVnKdhkfJ9ZE4MnStmRvs+A
         0WWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:suggested_attachment_session_id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=4cEXxt7sEZ3JLfqbqmu7ZmDIxOEnpVkqYVvzz7r1OUY=;
        b=DWXGag4Ejr0EtVS/v1jFdcmSOfIDsFIO3GgYlZ2bDR7QeDmRyy6rAlW3AS5XAW6CAP
         TYz235kCp4UmCEMaIngJjBZSni9cJaXKfBz6AAfKi1CqQzeYvJI+4hWoTqPYOx6O5eHA
         C+m4Y8g86eFM+f50llD/pMLdIM3w/lHTvfJUiPXJ/JqYEdMufDKN5Nf0FBoKmIzdCWIw
         y8rgPUcusBq/2bQBggU0WIsWxphoRghw0i3C96frcq7La1zhLL2G7s76kvIceTyH+Cb9
         4Xm67Bb62/1Do4AFlqgwTRdwDLfyDpNCQWQsUcHITDuqNDbnr7zt8cGoNyVdTZ0LtTOA
         RsEQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532WW4UFfJ+6T2ujr2Ap8I3pnTeuDjJnTCUfqMoci4440c+fGYON
	baCHHK0BOcqkioFt+CHGdMc=
X-Google-Smtp-Source: ABdhPJyPEqyAhbYJu9mbNZupEnrxLqTn6nspua8WNLhC7Sf0otebB+gnKkrnspCkGeK5uq7bwngz2A==
X-Received: by 2002:a05:620a:424c:: with SMTP id w12mr2788490qko.62.1638314263741;
        Tue, 30 Nov 2021 15:17:43 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:4728:: with SMTP id bs40ls202630qkb.8.gmail; Tue,
 30 Nov 2021 15:17:43 -0800 (PST)
X-Received: by 2002:ae9:f306:: with SMTP id p6mr2676245qkg.177.1638314263348;
        Tue, 30 Nov 2021 15:17:43 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1638314263; cv=pass;
        d=google.com; s=arc-20160816;
        b=sC8sKp7GOmM2DXUSvfaxIyx+ZSwIP3peDX5DLSa7fwFubprio2YxXWJtsDa0VicZpO
         77gFukfgfd1I/0gDj9FHb9EFgCFrqnLIrkvcEPTVKe+yr8119mm9KbFJqQNU/qXZWtvG
         1T8c5PbbKXNibT07ATRVxSF3kARc7DHOXQ/1HiJ5PgzIFyL9OpaY7gqn6vDw8P2+EdNL
         NTUm5oZVi8Z0Yuj1kja1TRdcSKCYm3JFyIrtseitdz3ZEsiXIj/YENf9M2ygdlpQhfZy
         wnXBfTRHfI12DiOh6z7Y5xtrYhIzjtAncP/9oxnKAqSULp8ATUa1ihmyyXuPbtf2cbCr
         1nHg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding
         :suggested_attachment_session_id:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:dkim-signature;
        bh=D7Tf6GS88yZuqdjq0FEKRC3v23T3rCdRo23v8s9j7Fk=;
        b=GZRDCskbNBuePfQRnx8A+0oBpw8WoGjOWu0w7NeBtHif1u+AX1spefwx7g9mUBMVNh
         9HTCUPLD9q2Zrkz47qeEBkDiSg0Ft7oi2fHri4zKYIw7HhMo1cJ3UKIopxpscqw5Aj5s
         gIDi5J+lHdsiYC99nPXl+zh4WIMQpzMQjK8q6DV4VhMZFy4wKZz6P141Powi1XkpITGE
         6i39KZ0EJa04T8XSb+ho8x71LwmvD7i9ZwjvisJvm7VgWtaoOt9RmUW/c1GhphPQvdMb
         mH1VhmWCEaH0PPXosoKlt+MmhrrjlA7ycVGVO5CmTZ6qjJVt4nGJRX6a2a3trvFPGun+
         bLfA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=XdgZZCqZ;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of stephane.viau@oss.nxp.com designates 40.107.3.60 as permitted sender) smtp.mailfrom=stephane.viau@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (mail-eopbgr30060.outbound.protection.outlook.com. [40.107.3.60])
        by gmr-mx.google.com with ESMTPS id i6si2231147qko.3.2021.11.30.15.17.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Nov 2021 15:17:42 -0800 (PST)
Received-SPF: pass (google.com: domain of stephane.viau@oss.nxp.com designates 40.107.3.60 as permitted sender) client-ip=40.107.3.60;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k+px8CuSdfWtjLpj1XAquwI617Qc/UqEJ1mnhdstNIP+KjEUPPVyquRSRSxbnGKVtTlOBj+cbPDfp0CU5+APNCzH6homPU6vfDWfzM2o9niKqj9HkErRSPEaQJARLlMSxhMJa8O0YI046FiMo9PsEA+iz1yCzoo4mhsr/PpfwqHNDtRV28tvIWqeADX0QC/SJITF/yMTe7StE2ckcsHqcXbA+ZBgeEOyRfB+I2mRfooIoO6JBo1W6jSmqQOl5prezlQv88bRGf5F+YPWmd/EGpHmznI1v68xTv7zKMYESHalrbQd5gelhB3ynzEQXLqZcy4Zn0CokLC+RtdJkLmbtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7Tf6GS88yZuqdjq0FEKRC3v23T3rCdRo23v8s9j7Fk=;
 b=BucJMkOTsIxclC5CHoQA8pEn4mRIMRoKN6V3tGuFpb5cQtr2Rd2HD4P2LleAaUuehs1wiqJpo1KBYsPvSwPa7d4lDCbMxFI3j4gD82QhVgnVkQIGleP8V+V2ujn/iLP/6UbD0UDhxNw2Q9Nu23mIJzY0bsBtqTynL/L6wdX1ll7ZTkKTSjCR1T66h67Ukmy4cOvAusLJO/xHPPca7YcYU/BwnTRgtLcWMiAajCkKLHD6t0WLXMt7YSLtGQ1pYNeETytHPpJmfTZ3XV4aRsJNeRgrVzZswhjuN1bdizApiXsaWJ06c3iht8ybomkt5MjfHLqqD7P33EUQ0BJPhTR7Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
Received: from PAXPR04MB8863.eurprd04.prod.outlook.com (2603:10a6:102:20e::19)
 by PAXPR04MB9399.eurprd04.prod.outlook.com (2603:10a6:102:2b3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Tue, 30 Nov
 2021 23:17:40 +0000
Received: from PAXPR04MB8863.eurprd04.prod.outlook.com
 ([fe80::81f8:3fd:3f3c:df36]) by PAXPR04MB8863.eurprd04.prod.outlook.com
 ([fe80::81f8:3fd:3f3c:df36%5]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 23:17:40 +0000
From: "Stephane Viau (OSS)" <stephane.viau@oss.nxp.com>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Jan Kiszka
	<jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
CC: Stephane Viau <stephane.viau@nxp.com>
Subject: Re: [PATCH 1/1] [RFC] configs: Introduce helper files to create
 inmate cell config
Thread-Topic: [PATCH 1/1] [RFC] configs: Introduce helper files to create
 inmate cell config
Thread-Index: AQHX4HIMKV9TFDcy4Uu1osNoV7h92KwVvziAgAAfaACABuFeZA==
Date: Tue, 30 Nov 2021 23:17:40 +0000
Message-ID: <PAXPR04MB88637977C317FB8FB91A3203A7679@PAXPR04MB8863.eurprd04.prod.outlook.com>
References: <20211123135721.23908-1-stephane.viau@oss.nxp.com>
 <f7ccb54a-26b1-1c62-02d4-093b5ca897bc@siemens.com>
 <db093dd2-fde8-a39c-3981-77e39c150b0d@oth-regensburg.de>
In-Reply-To: <db093dd2-fde8-a39c-3981-77e39c150b0d@oth-regensburg.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 3514869c-b18a-d4ad-7ddb-0a9cfadaabc3
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 65e78973-9964-4464-1c61-08d9b4579b23
x-ms-traffictypediagnostic: PAXPR04MB9399:
x-microsoft-antispam-prvs: <PAXPR04MB9399BAB3A03A813734DAD658A7679@PAXPR04MB9399.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fqz+zBxyTCmjEY/vrHYEAo8SyhmbI53AS/dx39RrHYMDwrXm/7IBMnnLw9Bn4VdXnYJ3MvDoZ3MtRGVrY2JbmS6uCao4dV3JQTwc/oI91DzWTLAcN4LuNiL3i/K0UMVT6crYMfQSunDLHORtl4an2/9iL7GN/rPoHjYedurQIl1EtmGod7HFoHAcqOCmlRZyfixEsfQofQ9lZYIwvchlnq19jmHnrk4iUoA0tIbvMeOg3lTpKJwwL81Ue25LDdhQQHrx/W75/QN3qCQU6Z1pYTakxSEhwBIJFHTFVbKvdf7uV+ASS/zxLGORM2MCPa394XcPPjT9WxpIoi817gU6PMeHJn4oHAmAyYK2cu70P2o4CORWv+mRxyzZx6gBWVHZKPORRIi1hBMtjiTP/F5LsUXPkukYPCPJDrPFnzuuaQWsDkjqWVhzrwLZANy8tfQZqEHrxt+yvCc/lCbJMxqNmxx1QWLskTPy575WZb33A2qh/IslNhyFFK9qF8CDoJjq3HkEZeYvC3wTA5zBoaWqXCxo/p5Tr/bAfgGfR0yCU3C+nwSGrY+c4TbQl5HM9bzer8mGP9GBI4V6HiTaDuUeZCg/2Fry2IRDEAxZaS8eoQfbyjYq70AtIefHBNLMTc4hJGWJbvO2xuAJMp2EbLQdtsxq4Smtfnsi2T5GbxXjX5MmAf2YW/6jksUsWCzvm31E
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8863.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(66476007)(55016003)(5660300002)(8676002)(66946007)(86362001)(52536014)(7696005)(6506007)(66556008)(2906002)(64756008)(66446008)(8936002)(76116006)(71200400001)(110136005)(33656002)(508600001)(26005)(4326008)(122000001)(38070700005)(186003)(91956017)(38100700002)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?sOKARCOszbzLJ7iCoXSUIaYRQIyOHiJGWT4RVzyv+os7AsnL+0tEe2hW1K?=
 =?iso-8859-1?Q?Eud/o5+JRGWImHDS8OORYkp/bkD5fdVDddrabf2Cuvqb3amrEPicpbcdOG?=
 =?iso-8859-1?Q?R8ads7WEPPOZc4xuW4R4T8LHTwKqNrvAhon8cwzcXZaPWGFExEEkzpnXJ6?=
 =?iso-8859-1?Q?5oPfC4UhMpfyCMsu+htfKx18atY1doh3SABIzCiT4l9JVaRzCyjII2OP42?=
 =?iso-8859-1?Q?6WOLSBOaoVQta+BqR0bFCi4E+Kb4hTO34mnDCdtBHx4zSYZApyDVDUmw9a?=
 =?iso-8859-1?Q?N7msOJbZkIRCnAQX9G1zHid9qH8R9d82ylbfQDTPc2YCwT/uieHSKvYYow?=
 =?iso-8859-1?Q?eAvJZ/UqCk6XJshaRp+7stYQSLPPNydl8Wskww+ilTiohha7dmaji0W7RA?=
 =?iso-8859-1?Q?QKhqUvzaI0ZO5Qr/oTTgycUCEjt4twCKlS4ft2CwWVDyBgRD3CFoFQpa6D?=
 =?iso-8859-1?Q?T9jjA1jlxCAjORaK5O6oQvwwxsSfSfCY/DsbfVVG2wissJqWteP89fnAuH?=
 =?iso-8859-1?Q?Ouoy7pefI5UW+qnfrspKCIKpU3n8Hd6++hErI/lrzoIqUDDu2+ouhY8Wc3?=
 =?iso-8859-1?Q?vCFLK284T/VuLt2UXOfHJKAeGGYdWuHEONZ87b56e8+nlUJ0Sc9YviufD1?=
 =?iso-8859-1?Q?2AhQciDW9r8lYnfQebXo+dqnKIhH/UUvFJPtALS4kXSEnsfCFyCXVrqn9q?=
 =?iso-8859-1?Q?wX1U0iBJlc2gnGtMyNy9zh/inFhQ4TVxCPPKm2cWhE8EgNLuOaEPM4YY59?=
 =?iso-8859-1?Q?Lsfhlz8Xz5mdqcWNLMgStDFtuZZdUX+aArg4YB2MJOA9XIAw2ZOUu7QS9M?=
 =?iso-8859-1?Q?DTY/ei1IW+HrdQnKGjRzEdGR+H+pfrmDTdZh4Tea9UrpO3Glz41yRM+RyP?=
 =?iso-8859-1?Q?PuqXPE0mK7xMpAKlNNceAAyzfihnfJsM0QMR1zn2Wz2f+He3UJoog6qwix?=
 =?iso-8859-1?Q?o9HnFB0H+0hVZvxkosQCzzMqHvfpGycpDkxT0QjZbwXDKElQ+P5RP/qirI?=
 =?iso-8859-1?Q?z6GlTv9HfE22+vWkJppwUE+UMWuvLa3DnDt/e7Hoqt/oQNJU7Js2EXYFGv?=
 =?iso-8859-1?Q?7sg8cATbrvZjj+wis+fNZXNK/LhjTMv1lkrLPH9VgtV6fvOu3sWsnACdyx?=
 =?iso-8859-1?Q?H8vTYhz4CIifn51YB0k3UkphmQPc1ORmzJTy7FUe2tGlwxpFFSBhQ+p+Pq?=
 =?iso-8859-1?Q?Foxj4WkzEzVxKMuV0q+nzVDo4iWNAopxiDgSfi4qpnfi07qHzydJ0d2RBr?=
 =?iso-8859-1?Q?JP/18YkbGoqMgE0TtcbqVDdYeh/wtZC7SYKoQK7NMI53rZcAxFk9DGA4c6?=
 =?iso-8859-1?Q?KwIGmY7mlj4bROrqGYIJGIBZsxwqV3OX86KXtI296SJvBzDsgRkctrbZm9?=
 =?iso-8859-1?Q?5w7AX8MRvAruuVfXSwfd/zoxgd27ByrPRKlyI67X47obAvxDM0KmxJDIZg?=
 =?iso-8859-1?Q?RiyjlihVCNatD+4OOnpPdIKLfkoBQ6GxoQ7HeJHj0Ds+qHxSIaRm2zNp5P?=
 =?iso-8859-1?Q?YMRUxCyekia3bNB6SHaH0+qfxzLS+WDHxbOLRh44axcXcVANNirYiH2CYh?=
 =?iso-8859-1?Q?IfVbA4nVmQegtjjntBbdI8fzJN/wNntPHU/wf1Tpo1OblfBxOGYBmi2OLG?=
 =?iso-8859-1?Q?B81ZQaH3P4kvfsu/5LwhhbBNkM5hk8yPNKj5eD9gCKMwn/I/dryvNmx5gq?=
 =?iso-8859-1?Q?eRwGdfn7WuQyT0PL/sh5F26GFflH2iTBuIxtY5omaGNJGjng7kB0X/SC8L?=
 =?iso-8859-1?Q?6J7kNSlEP2xrlEMPtozyELXjPUf61Fa2YXMpQlHqnVAI+9?=
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8863.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65e78973-9964-4464-1c61-08d9b4579b23
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2021 23:17:40.6076
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AaVdjesDyH2CF96ZyD7s4WwpPlqUK2b58N0sAD7Ba+wNkGK1+sbnnGQATM6oE1efkBWNkc+qm1qELvMcF0otjguXSkBOi+bKjUocMhy+P/7+OQBmFWMtXzOERZfgcu39
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9399
X-Original-Sender: stephane.viau@oss.nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com
 header.b=XdgZZCqZ;       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com
 dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of stephane.viau@oss.nxp.com designates
 40.107.3.60 as permitted sender) smtp.mailfrom=stephane.viau@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
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

Hi Jan, Ralf, 

Thank you both for your feedback on this RFC. Glad you like it.

<snip>

>>> diff --git a/configs/arm64/cell-helper.h b/configs/arm64/cell-helper.h
>>> new file mode 100644
>>> index 00000000..d35bc0fb
>>> --- /dev/null
>>> +++ b/configs/arm64/cell-helper.h
>>> @@ -0,0 +1,76 @@
>>> +/*
>>> + * Cell Configuration - Generic definitions
>>> + *
>>> + * Copyright 2021 NXP
>>> + *
>>> + * Authors:
>>> + *  Stephane Viau <stephane.viau@nxp.com>
>>> + *
>>> + * This work is licensed under the terms of the GNU GPL, version 2.  See
>>> + * the COPYING file in the top-level directory.
>>> + *
>>> + */
>>> +
>>> +#ifndef KB
>>> +#define KB(bytes)   (1024 * (bytes))
>>> +#define MB(bytes)   (1024 * KB(bytes))
>>> +#endif
>>> +
>>> +#define REGION(phys, virt, bytes) \
>>> +    .phys_start = (phys), \
>>> +    .virt_start = (virt), \
>>> +    .size = (bytes) \
>>> +
>>> +#define MEM_REGION_RW(phys, virt, bytes) \
>>> +    { \
>>> +            REGION(phys, virt, bytes), \
>>> +            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, \
>>> +    }
>>> +
>>> +#define COMM_REGION_RW(virt, bytes) \
>>> +    { \
>>> +            REGION(0x00000000, virt, bytes), \
>>> +            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | \
>>> +                     JAILHOUSE_MEM_COMM_REGION, \
>>> +    }
>>> +
>>> +#define MEM_REGION_RWX(phys, virt, bytes) \
>>> +    { \
>>> +            REGION(phys, virt, bytes), \
>>> +            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | \
>>> +                     JAILHOUSE_MEM_EXECUTE, \
>>> +            }
>>> +
>>> +#define MEM_REGION_RWXL(phys, virt, bytes) \
>>> +    { \
>>> +            REGION(phys, virt, bytes), \
>>> +            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | \
>>> +                     JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE, \
>>> +    }
>>> +
>>> +#define MMIO_REGION_RO(phys, virt, bytes) \
>>> +    { \
>>> +            REGION(phys, virt, bytes), \
>>> +            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_IO, \
>>> +    }
>>> +
>>> +#define MMIO_REGION_ROS(phys, virt, bytes) \
>>> +    { \
>>> +            REGION(phys, virt, bytes), \
>>> +            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_IO | \
>>> +                     JAILHOUSE_MEM_ROOTSHARED, \
>>> +    }
>>> +
>>> +#define MMIO_REGION_RW(phys, virt, bytes) \
>>> +    { \
>>> +            REGION(phys, virt, bytes), \
>>> +            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | \
>>> +                     JAILHOUSE_MEM_IO, \
>>> +    }
>>> +
>>> +#define MMIO_REGION_RWS(phys, virt, bytes) \
>>> +    { \
>>> +            REGION(phys, virt, bytes), \
>>> +            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | \
>>> +                     JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED, \
>>> +    }
>
>Nice, I guess that at least these macros really help. Sysconfigs would
>also benefit from it.

Definitely help creating cell configs (we use something like ~10 variants
that look alike) - it's much faster - and more readable - this way.

>
>>> diff --git a/configs/arm64/cell-template.c b/configs/arm64/cell-template.c
>>> new file mode 100644
>>> index 00000000..bf731101
>>> --- /dev/null
>>> +++ b/configs/arm64/cell-template.c
>>> @@ -0,0 +1,32 @@
>>> +/*
>>> + * Cell Configuration - Structure definition
>>> + *
>>> + * Copyright 2021 NXP
>>> + *
>>> + * Authors:
>>> + *  Stephane Viau <stephane.viau@nxp.com>
>>> + *
>>> + * This work is licensed under the terms of the GNU GPL, version 2.  See
>>> + * the COPYING file in the top-level directory.
>>> + */
>>> +
>>> +#include "cell-helper.h"
>>> +
>>> +/* Name, cores, entry point */
>>> +#define CONFIG_INMATE_NAME          "inmate-cell-name"
>>> +#define CONFIG_INMATE_CORE_BITMAP   (0b1100) /* inmate uses cores 2 and 3 */
>>> +#define CONFIG_INMATE_BASE          (0xc0000000) /* entry point in DDR */
>>> +
>>> +/* Memory & peripherals */
>>> +#define CONFIG_INMATE_REGIONS_NUM   (1)
>>> +#define CONFIG_INMATE_REGIONS               \
>>> +    MEM_REGION_RWXL(0xc0000000, 0xc0000000, MB(16)),   /* RAM */    \
>>> +
>>> +/* GIC */
>>> +#define CONFIG_INMATE_IRQCHIPS_NUM  (1)
>>> +#define CONFIG_INMATE_IRQCHIPS_ADDR (0x38800000) /* GIC DISTRIBUTOR BASE ADDR */
>>> +#define CONFIG_INMATE_IRQCHIPS_BASE (32)
>>> +#define CONFIG_INMATE_IRQCHIPS_BITMAP       \
>>> +    (1 << (29 + 32 - 32)) /* UART4 */
>
>In case of the irqchips, I don't see that the definitions bring any
>help. It's about the same size as rolling out the structures directly.

Well, not much true. But since I'm trying to hide field names of the structure, why not.

>
>>> +
>>> +#include "cell-create.h"
>>>
>>
>> Thanks for the proposal. Could you share some converted inmates as well
>> so that we can see the impact more clearly?

Let me send a v2 with an example as a 2nd patch.

>
>Do you also have any plans for system configurations? At least the
>MEM_REGION-macros could help to condense stuff there as well.

Hmm... not sure yet what that is (I'm just starting using Jailhouse) ; but will
surely take a look at it after sending my v2 patch set.

BR,
Stephane.

>
>Thanks
>   Ralf
>
>>
>> Jan
>>
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/PAXPR04MB88637977C317FB8FB91A3203A7679%40PAXPR04MB8863.eurprd04.prod.outlook.com.
