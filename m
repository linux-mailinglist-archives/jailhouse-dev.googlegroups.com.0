Return-Path: <jailhouse-dev+bncBAABBT7QXGOAMGQESPKI4OA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1996438DE
	for <lists+jailhouse-dev@lfdr.de>; Tue,  6 Dec 2022 00:01:40 +0100 (CET)
Received: by mail-lj1-x23d.google.com with SMTP id y19-20020a05651c221300b00279958f353fsf3361310ljq.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Dec 2022 15:01:40 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1670281297; cv=pass;
        d=google.com; s=arc-20160816;
        b=BKWUcQFqEU96WIbwvA0sWhejzD+cW9dMMrlPO3QzdqmN5gxkZozj6R3VNz+nnqBqeq
         70Hfz6pd3ioGwwUocN12Klc1Roo2ZEqDYcly9Lmrd3K6ZfNOsoXqKQwTYPn5LP4pY7hD
         xBLSPvYxgi188nroy26cWGPA1MxIX71KYBhHrw+8Equh5ecbtv5KRuqLQNvu8Nueb+Ym
         5hGXHfTBdEHN2qXtuOUCHgLpFcZ2HnTVFlVKhyM23vwL+g1dHLvSE2HSecbNn9q+egNm
         DUWPNRvBskGf8Yze6Dz/WaYVSi/TESL2ve75ZaW3Gf57or3y3k6P9nTfCm0ak92jDzT7
         y2Bg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:msip_labels
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:cc:to:from:sender
         :dkim-signature;
        bh=7aGPdTHKt59aJWBtWLICkogpL7zeEXXnJn6pTbvqBoY=;
        b=biGclZ7fa1R/9ZD6MNLT3IoGCT5eIjVNYv2zrgZiiLmpPwT8+RO5gitBBWL40T6J9q
         R/y1jplr02R11sRFRcZze1CKg+dO76hgrDXEuKd1At7fhkRNzYBUn0db9A+zibWfOEPr
         HdSa53U4ZGlBr4GMGHDjCt5W5x4avVTxCQXDFqyygddNt5TYiyLxrMoSvAcyJUNUqtVe
         P9v0BHDwYbilbqtyCXp6geNyhmR1PVByyHz3F9ncRbCKijpQtpHpFIUdsd5vrfH4679Y
         UYGT0XkPqRE6MAlRgBJpJkQgAEWsVDaHHcaxSBAZODUMZgh9t4JGemBUe84lx1byv3/w
         XkQw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@ed.ac.uk header.s=selector1 header.b=3txk9U7S;
       arc=pass (i=1 spf=pass spfdomain=ed.ac.uk dkim=pass dkdomain=ed.ac.uk dmarc=pass fromdomain=ed.ac.uk);
       spf=pass (google.com: domain of karim.manaouil@ed.ac.uk designates 129.215.17.202 as permitted sender) smtp.mailfrom=Karim.Manaouil@ed.ac.uk;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ed.ac.uk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:msip_labels:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7aGPdTHKt59aJWBtWLICkogpL7zeEXXnJn6pTbvqBoY=;
        b=MTrTZDnJtdrlojcjGPDpyuGcwTt5YhpApf254Q43+G8gDOimVQ1oriMEJ7/joK+dPP
         md3xHQwiYZg84PMGIAbFPHTFsjtnrd423NhHG+KRGueRxzrQoSaUS/5s5I2ZzDUyLlA8
         OIHJdmM/ZMhTpBmjuvJSU5a9/dc/d9ob2lEunBwkLHaD0zMAn97XDX2++fnlKH7qTm/W
         j0FCynwHuRz6ZK8zr3rNYtBxaZAKAupYuaysH3rgOkZVgmsRZlEcDaILxLiaqjmPBC/m
         gnVoaRL8jMFvkv4BcSe1jdeJoMJZs+SiZZXEMnZuqBWfCLWkHhWlE5e+S8rVdvSDA6p4
         FWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :msip_labels:content-language:accept-language:in-reply-to:references
         :message-id:date:thread-index:thread-topic:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7aGPdTHKt59aJWBtWLICkogpL7zeEXXnJn6pTbvqBoY=;
        b=DrNyME/qKlmZoFjPZhTZwX0Q58vSFuUlXBNHmmNUPEZ8qFoCJL6etE0zthxWRg0SRp
         o6FIyLBhm22SIvJoxxeK6vREq0Rv1DtgdlLTshXAVITxrMjfej4hn+6DWywHHQUO1jWZ
         BfJ+kUqbHunQwVPuBTvTyAuSWlXlLb6l4mTlaTWR+pbLk7BMylG4s9d5Wk8w10wx9Ofg
         T31K/OXLSYeFgCLHucleaCRWoPIEVyYgi86IBeymp3Ggpopf9qXWEFSviI2QwMUzaH5E
         Cz+yNoIyoEKq3ePA6wO/ptgNR9qFu9VP/9Xyr3aHK+5OE1rHFEqAfir4Ta9cB0qELoW+
         MHmg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANoB5pkWc7A7TURbCee8Iu934SEFud5bieNdko+PGRvHaoAcQ+XGnqEI
	GzyZ5Xb802yYvCB28afRM+M=
X-Google-Smtp-Source: AA0mqf4CZ/3qy2XpF4nMpv68Axi9b25AA/rbDlNeMXHMcI6H0ENqw4IfcNoamo7I/CZRUOHEmbLxmg==
X-Received: by 2002:a05:6512:3e0c:b0:4a9:bdb3:9db8 with SMTP id i12-20020a0565123e0c00b004a9bdb39db8mr32387060lfv.643.1670281295938;
        Mon, 05 Dec 2022 15:01:35 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3457:b0:4b5:3cdf:5a65 with SMTP id
 j23-20020a056512345700b004b53cdf5a65ls1663466lfr.2.-pod-prod-gmail; Mon, 05
 Dec 2022 15:01:34 -0800 (PST)
X-Received: by 2002:a05:6512:3b20:b0:4b4:d3aa:8f8c with SMTP id f32-20020a0565123b2000b004b4d3aa8f8cmr22692075lfv.94.1670281294363;
        Mon, 05 Dec 2022 15:01:34 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1670281294; cv=pass;
        d=google.com; s=arc-20160816;
        b=g6ocIt//O+6wt7N2Km5SUHYwXZQYQYJGUSziFqrz7vHYLFXX+u6nQiHwXB27nfosQ1
         ILnTm28LC8b2sm2F2/3EAWdul+eE7s33Vd/bPdRCiYumFeG7ZSteg4YWkAATWv22iD3t
         jON1smuQL8d2xBsoVrJ7PU7LyAEMNQcn+faC4LdN4zf6o2Rh9lyNl6pOUQamDpLoocRR
         a+XxQDsusooM2KXhZ/DgwqQtYI/ekG7B4ciV/q1o3/dF+ZNPvJ8fK4jPllKvGOitDQUT
         k1zuyuAVXRNY2hwTqPPdhLDHLeYRNA81NeeX802bHQr1kOedCSpY8wHypaeBj8AgynaB
         hn1A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:msip_labels:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:dkim-signature;
        bh=GCcbCs7db2liGjxccAkgAXxSHp3sgIFWJt/oCL2du2w=;
        b=oXNXz26KPpfxu4snC2OISBwTs8eDLeoq8Q40ETv0G0oBi/mRrlwSmyOPYTX2Yep1UN
         eBPnhn8LNsZ4g3Ys1+YwM7zpZZR0yipCs5jw4b3fJIsJ6fZ82ZXW2Z21cl6DDHDu85Hb
         Fyg565X7kKgduYj+bJaisnv52bmasn9QNUxe1WTTWlXrQmEOIfFfo/d8tIbj+XvCn3Zk
         tQElJKHb91DkKweNCI38oUBX75wfRfWoclSh6h5gx5cq7zvRybo7W327U5UZTT9W+4oA
         cgN3HcJeZquamBxH5plJ/MiqnZTTOv/aHWSueLcfjpaa3mMQ9fBstNXLLW7QnvMC0nFI
         RIHw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ed.ac.uk header.s=selector1 header.b=3txk9U7S;
       arc=pass (i=1 spf=pass spfdomain=ed.ac.uk dkim=pass dkdomain=ed.ac.uk dmarc=pass fromdomain=ed.ac.uk);
       spf=pass (google.com: domain of karim.manaouil@ed.ac.uk designates 129.215.17.202 as permitted sender) smtp.mailfrom=Karim.Manaouil@ed.ac.uk;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ed.ac.uk
Received: from seine.is.ed.ac.uk (seine.is.ed.ac.uk. [129.215.17.202])
        by gmr-mx.google.com with ESMTPS id s7-20020a056512314700b004abdb5d1128si738938lfi.2.2022.12.05.15.01.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Dec 2022 15:01:34 -0800 (PST)
Received-SPF: pass (google.com: domain of karim.manaouil@ed.ac.uk designates 129.215.17.202 as permitted sender) client-ip=129.215.17.202;
Received: from exseed.ed.ac.uk (hbdat3.is.ed.ac.uk [129.215.235.38])
	by seine.is.ed.ac.uk (8.14.7/8.14.7) with ESMTP id 2B5N1Wo4011729
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 5 Dec 2022 23:01:32 GMT
Received: from hbdat3.is.ed.ac.uk (129.215.235.38) by hbdat3.is.ed.ac.uk
 (129.215.235.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 5 Dec
 2022 23:01:32 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (104.47.14.50) by
 hbdat3.is.ed.ac.uk (129.215.235.38) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 5 Dec 2022 23:01:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N9C1NQ89a7DBhWApM1qPZcE4goOpCFsgNtApAwmg4XFKd9P1qWkAdGd6EBD26rrOUd03PQ+97NZrdOybPlW/14XiWDhmYyJ6+EKejFJk60y78Jq0EiNxmwjlaAK4T2GM7fvf1g76TiZFQhCcUgif0fD0xvbU7RF1Ywuxpiso6bhzAorLeqrsPh78544IPE5D0tD9qTt58dr9UCWeZ+/QEc5tmvlopQpQ7pB36usmLoeGL1Do6LxdcKo4BVGhO3qCLnS7qqKFbja4GykOyXnxgPIQvjjFlDoO6YfydZnrGS1lFC07vT7N/VBfr8K4z5NixPmWkV7SnHhcZt7YdElEDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCcbCs7db2liGjxccAkgAXxSHp3sgIFWJt/oCL2du2w=;
 b=N5oHpEfFXK3oTYcE4umpW9GgT9FXIXLMR1zWXQSn9xwIvAQqy7le4gjQBK4pNSeCgMgZm+q/9pt1uGwLDHQtqJSvDtDrQUMkHisqLIhLY8GLoq4+qDLM8b7Wgn+sXB0r+YoU9MKnV3I4XsibPvWg4tSKSpeeV7pQwPWHVQ0E9ArI67UAW2HXVO0gABjUiZ77bE0bKRytEPStZ5P/MJ1PWq2GXzcdYh7fZacju+/Zz3s2pLgJcKdGFz4fUHoPt+M+KRqY5O4GRtxXkm8Bbqp25pxRJM1CKd9sPfWQLkQZvhBV0TXDTroTZ6Od3gSCr3BOWnsgsQulZFjXvL12S/nvWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ed.ac.uk; dmarc=pass action=none header.from=ed.ac.uk;
 dkim=pass header.d=ed.ac.uk; arc=none
Received: from AM0PR05MB6018.eurprd05.prod.outlook.com (2603:10a6:208:12b::26)
 by AS4PR05MB9135.eurprd05.prod.outlook.com (2603:10a6:20b:4eb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Mon, 5 Dec
 2022 23:01:31 +0000
Received: from AM0PR05MB6018.eurprd05.prod.outlook.com
 ([fe80::960e:4fc1:3ee:db81]) by AM0PR05MB6018.eurprd05.prod.outlook.com
 ([fe80::960e:4fc1:3ee:db81%4]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 23:01:31 +0000
From: Karim Manaouil <Karim.Manaouil@ed.ac.uk>
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>,
        Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        "Henning Schild" <henning.schild@siemens.com>
Subject: Re: [EXT] Jailhouse: unhandled APIC access when booting a Linux guest
Thread-Topic: [EXT] Jailhouse: unhandled APIC access when booting a Linux
 guest
Thread-Index: AQHZCKLmHqaCkuXHN02aIr7wQ3HbOa5fXfiAgAAd7YCAAGn4ZQ==
Date: Mon, 5 Dec 2022 23:01:31 +0000
Message-ID: <AM0PR05MB6018FE1A28FCA35C3D120C03A9189@AM0PR05MB6018.eurprd05.prod.outlook.com>
References: <AM0PR05MB601814D935B73250E59EA696A9189@AM0PR05MB6018.eurprd05.prod.outlook.com>
 <06f03e95-7ff4-3822-aeba-be48e5006b15@oth-regensburg.de>
 <b48f1252-a6b7-a183-7f37-080b95043ad6@st.oth-regensburg.de>
In-Reply-To: <b48f1252-a6b7-a183-7f37-080b95043ad6@st.oth-regensburg.de>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR05MB6018:EE_|AS4PR05MB9135:EE_
x-ms-office365-filtering-correlation-id: 5e1467d9-1229-44bd-0d04-08dad714a608
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3JU1Rhgzq5kBjf6CVML5ZAeXGhXG1sRRruMnH4/rkyoNe7mKtKIRFrOasjB6UmmWpTunZpIKFczDisw5d7e2BopdFI2QhYOJDeG4Qee3CXSQO7FcPA3vDKv9FFYbnNYHWivKSVRLm3sQ5w8Mbv3iQS1+7sahQvnwtGe2USRpffxxeQXOB6VpCeMVoEKiN/At/C2G2XXHdV9IVAAPOqO8PPo0DRjQQl3lu71Q1AjxbvsVdzwX+9D8+q7NgNZ+U00nQhJ5ZKyWso6mmfI+1kg70XPrWfe7PWKr87w8dVPDEK7a/6bQUwtW8ynrwoNmi/bpG+mpLZRWTapuml3WbyYVqJI0d0HZgSr11BFb/6jZX8SH5B0oxYMuWxh4OQ7NqgNLZnm9ZMgsTsvMb8dX0MJY1iQMPGwWejDCJQ61n/lFr0k2/ADHQqxGw3t/dDKXh7+bdeyI01wPg+sKRMV4fJyH8gqsU6hTO8dQ6oi9JNWT14z9/Fc2VH6izZmLXlkDT6BC52l7RrCY9inznsFeg+g/tEQ54fgtG0Tc+lFPJ3Gvb3JO4bxtbkoSzgxZU56gJ3P1Zx+7hJHmHKA7SKjuvylG+ghgp4T05iH7vPamn7gcPlrtn47XL09uqdvAif7hb4ijIlKIjBXCXb6IZP8Nows5Muen0aHCkld/6PZN3oURYlRfFhoo2aaN+FBvkmWgDl0zIsAF9rzaLZSDCxVp5KPFmE670QULarCrcBoDDT/F1kY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR05MB6018.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(136003)(396003)(39860400002)(346002)(451199015)(54906003)(110136005)(9686003)(478600001)(71200400001)(26005)(53546011)(966005)(166002)(786003)(316002)(66476007)(76116006)(4326008)(8676002)(91956017)(66946007)(64756008)(66446008)(66556008)(6506007)(7696005)(19627405001)(8936002)(52536014)(186003)(2906002)(83380400001)(66574015)(41300700001)(38100700002)(122000001)(38070700005)(5660300002)(33656002)(41320700001)(55016003)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?GDqhgu4hbUss1NCHIY+fGYrzc4cajU1d9XBkafylkQlQybEYIQZJsrWF?=
 =?Windows-1252?Q?sjrD65g4+tkG94P0EED/TvDhTFvkhwYXd8gfFqVeHkTMzlYiIv2Lm+df?=
 =?Windows-1252?Q?/G2Y8lJLtYWXWwHAXSqTioPeWA3WzSrGafxxJFw1JmGekOl21qpQ+mBN?=
 =?Windows-1252?Q?ahW6xazc6AyNqDAoB3F/3p4U7DjspyOd4xo0vmRJiSmmKhSf+UVaedgc?=
 =?Windows-1252?Q?YCymq3cBjwLK/2vHMjc3nnLGPEJ0FDnrJFVkEZeEhQoOjbGQU0mouxF9?=
 =?Windows-1252?Q?IMBMEE5A2enoC7u5p2oLgJqmbeLyELlTjeteI6GsAetrO380GswCW0aD?=
 =?Windows-1252?Q?sFYwls5oC7TPpaPnH6izhBZmJhTPSTiNquOGx3FHiq2Pw7UCm+PtAeqI?=
 =?Windows-1252?Q?dJ7nZ8xUutGSXfHLhcKtx7IS5MMye8Eq78W7jhBEzapdnu8c6Mi0IXYt?=
 =?Windows-1252?Q?5/Nz5tf7l32iOoVX9DAAmw4zV8HNJ3kpqQ3TTwZE3aKc2LNRXCsP8Iu3?=
 =?Windows-1252?Q?zyGRvx+h4nVDXsFwqpMaIvdWHZItoxgy/YdwDP8XSuaG/X3VeVKgj2WQ?=
 =?Windows-1252?Q?0U/5UoxELLQRGLDp+uwdX8Yn4l8boPYbOF2pc7u2Aokq9yRMlEYiDQnQ?=
 =?Windows-1252?Q?UZaJkUymyzWgeaGaIQvGsyEztkWJ7/oDh9zbXT+TaiDCDCS+eDcJMJK8?=
 =?Windows-1252?Q?Ind31ovmz4IglnYtjoVhBHa0llCVLvORmxxbhAhinjDNVLLqXCeKEZGT?=
 =?Windows-1252?Q?42I8unkeA0WIE4F7GsoHlOLGi4OcPaBP7GnK5NPDeBMLooz9MaNsC8mx?=
 =?Windows-1252?Q?m7OUVEPJJpQs39zktcPOXD46+v+r3sx+vurIdWPMIaNSLrzXqE9p9EmB?=
 =?Windows-1252?Q?KnVlDD5o3tzUaDYw60YN+LFJKtYWQj9xTsiXveidGJLY5uUJYkYAL8Nm?=
 =?Windows-1252?Q?wdsVfbWr0K4Bz5XdS8u/1BW2vgyQieC3cRgOO6JH4zW+Dn3j+0ybedGd?=
 =?Windows-1252?Q?sCiqCnMYFYuEAEqmVBWWW5UpXSGfxmyvHthYqS2+y3GGKupQPBSX54Gn?=
 =?Windows-1252?Q?bLE6/klOn8lAZquoDfooJ+AElk9HBMX3EcrbbJGuAAhj04ZzP9viWMNd?=
 =?Windows-1252?Q?IwDPw+tjTccXtQR1gNkptbMTABVi6HRIw0lHjy0fLlTmtOLYsGmWpO19?=
 =?Windows-1252?Q?uxL2DnvtP0i5w4OVzU9r7SgnLTxPAQqLiZbHzSNprAM1rRdhYw66jAc2?=
 =?Windows-1252?Q?wCtktiNBzCMf+LORlFn7pV6HLoF5N4745mU6r2ExCVRqvDhuQUc00LYe?=
 =?Windows-1252?Q?097qGPCgfHIDCSKvIcRwmnJI+nr6T4r0y+Iz9ZJqrJTKY746nCawgwXk?=
 =?Windows-1252?Q?J+Om4JspH80gm/kNZMJjAZ0UNst55HUYspcfTWkFlffvU7Tv2/RoIu0I?=
 =?Windows-1252?Q?COpheOB1pZNlEWYip893Kl/UktungwLxAM7tzOPTJqc8E/pcxpIFUX1p?=
 =?Windows-1252?Q?LTOg8a2IiY9b7ZGzP2tTMU6yHL1fZ1alKiga7wEwyWwTB7UQUogNGRSe?=
 =?Windows-1252?Q?tbRgdYfbK8rmm7htC25x6glDRPjGaxaB+9rRVpZYeryEVDxnvLZ4ZAdZ?=
 =?Windows-1252?Q?X/WO1wesXJpSnQ4QoVYjMc/6uRpMrn+upUN7/pS2Y6ZwlbpUHng21qns?=
 =?Windows-1252?Q?avsgMMm/LuU=3D?=
Content-Type: multipart/alternative;
	boundary="_000_AM0PR05MB6018FE1A28FCA35C3D120C03A9189AM0PR05MB6018eurp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR05MB6018.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e1467d9-1229-44bd-0d04-08dad714a608
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2022 23:01:31.0741
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2e9f06b0-1669-4589-8789-10a06934dc61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /fjHavnshHs7o3hNk9HSQstkw4N1sOKT51+VAOwcc3UJtE0H4dLn/4PaTtjB0xOOAuAKL9VzByWSI8zQkz61Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR05MB9135
X-OriginatorOrg: ed.ac.uk
X-Edinburgh-Scanned: at seine.is.ed.ac.uk
X-Original-Sender: karim.manaouil@ed.ac.uk
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ed.ac.uk header.s=selector1 header.b=3txk9U7S;       arc=pass (i=1
 spf=pass spfdomain=ed.ac.uk dkim=pass dkdomain=ed.ac.uk dmarc=pass
 fromdomain=ed.ac.uk);       spf=pass (google.com: domain of
 karim.manaouil@ed.ac.uk designates 129.215.17.202 as permitted sender)
 smtp.mailfrom=Karim.Manaouil@ed.ac.uk;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=ed.ac.uk
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

--_000_AM0PR05MB6018FE1A28FCA35C3D120C03A9189AM0PR05MB6018eurp_
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrej and Ralf,

Wow that's a very weirdly specific bug. But It's amazing! Thank you, guys!

(Still intriguing why it happens only with Jailhouse, but not on baremetal)=
.

Cheers
Karim
________________________________
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Sent: 05 December 2022 16:28
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>; Karim Manaouil <Karim.=
Manaouil@ed.ac.uk>
Cc: jailhouse-dev@googlegroups.com <jailhouse-dev@googlegroups.com>; Hennin=
g Schild <henning.schild@siemens.com>
Subject: Re: [EXT] Jailhouse: unhandled APIC access when booting a Linux gu=
est

This email was sent to you by someone outside the University.
You should only click on links or attachments if you are certain that the e=
mail is genuine and the content is safe.

Hi all,

On 05.12.22 15:41, Ralf Ramsauer wrote:
> [Adding Andrej]
>
> Hi Karim,
>
> On 05/12/2022 13:30, Karim Manaouil wrote:
>> Hi Ralf,
>>
>> I am trying to boot a Linux guest (based on
>> configs/x86/linux-x86-demo.c).
>> I tried to debug and solve this issue for a while but no success so far.
>>
>> The cell is created, and the guest starts booting, but then fails when
>> initialising the APIC. A write to an APIC register is intercepted by
>> Jailhouse and it decides that the guest is trying to set an invalid LVT
>> delivery mode. I checked the x86 documentation, it seems that it
>> should not be invalid, but I am not knowledgeable enough.
>
> Sound familiar=E2=80=A6 I remember that Andrej and I have hit this one on=
 an AMD
> machine some years ago:
>
> https://groups.google.com/g/jailhouse-dev/c/1wRKIiGN0GA/m/_p_NSIBpDwAJ
>
> Andrej, do you know how we finally (quick?)-fixed that issue back then?
> Did we really have hardware misbehavior? It's been a while, but as far
> as I remember that was the case.

Afaik it was a CPU bug.
We had to apply the attached patch to the kernel to make it boot as guest.

Thanks,
Andrej

> Thanks,
>    Ralf
>
>>
>> Here is, pasted below, the log output from Jailhouse and the booting
>> guest kernel.
>>
>> PS: I am following the steps in Documentation/non-root-linux.txt and
>>         using the patched kernel in queues/jailhouse branch.
>>
>> Cheers
>> Karim
>>
>> ---
>> Jailhouse:
>>
>> Cell "linux-x86-demo" can be loaded
>> Started cell "linux-x86-demo"
>> CPU 2 received SIPI, vector 100
>> CPU 3 received SIPI, vector 100
>> FATAL: Setting invalid LVT delivery mode (reg 35, value 00000700)
>> FATAL: Unhandled APIC access, offset 848, is_write: 1
>> RIP: 0xffffffffaf84fb92 RSP: 0xffffffffb1003e80 FLAGS: 246
>> RAX: 0xffffffffaf84fb90 RBX: 0x0000000000000180 RCX: 0x0000000000000000
>> RDX: 0x0000000000000000 RSI: 0x0000000000000700 RDI: 0x0000000000000350
>> CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
>> CR0: 0x0000000080050033 CR3: 0x000000003ae0c000 CR4: 0x00000000000406b0
>> EFER: 0x0000000000001d01
>> Parking CPU 2 (Cell: "linux-x86-demo")
>> Cell "linux-x86-demo" can be loaded
>> Closing cell "linux-x86-demo"
>> Page pool usage after cell destruction: mem 2972/32211, remap
>> 65703/131072
>> CPU 2 received SIPI, vector 96
>> CPU 3 received SIPI, vector 96
>>
>> Linux demo guest (last few lines from kernel boot log on the serial
>> console):
>>
>> init, 1176K bss, 73676K reserved, 0K cma-reserved)
>> [    2.960440] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2=
, Nodes=3D1
>> [    3.040332] Dynamic Preempt: voluntary
>> [    3.083151] rcu: Preemptible hierarchical RCU implementation.
>> [    3.151749] rcu:     RCU event tracing is enabled.
>> [    3.205830] rcu:     RCU restricting CPUs from NR_CPUS=3D64 to
>> nr_cpu_ids=3D2.
>> [    3.284872]  Trampoline variant of Tasks RCU enabled.
>> [    3.345191] rcu: RCU calculated value of scheduler-enlistment delay
>> is 100 jiffies.
>> [    3.436710] rcu: Adjusting geometry for rcu_fanout_leaf=3D16,
>> nr_cpu_ids=3D2
>> [    3.518471] NR_IRQS: 4352, nr_irqs: 424, preallocated irqs: 0
>> [    3.585483] rcu: srcu_init: Setting srcu_struct sizes based on
>> contention.
>> [    3.667665] Console: colour dummy device 80x25
>> [    3.720639] Enabling UART0 (port 0x3f8)
>> [    3.766423] printk: console [ttyS0] enabled
>> [    3.766423] printk: console [ttyS0] enabled
>> [    3.866333] printk: bootconsole [earlyser0] disabled
>> [    3.866333] printk: bootconsole [earlyser0] disabled
>> [    3.985019] APIC: Switch to symmetric I/O mode setup
>> [    4.046377] Switched APIC routing to physical flat.
>>
>>
>> The University of Edinburgh is a charitable body, registered in
>> Scotland, with registration number SC005336. Is e buidheann
>> carthannais a th=E2=80=99 ann an Oilthigh Dh=C3=B9n =C3=88ideann, cl=C3=
=A0raichte an Alba,
>> =C3=A0ireamh cl=C3=A0raidh SC005336.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/AM0PR05MB6018FE1A28FCA35C3D120C03A9189%40AM0PR05MB6018.eurprd=
05.prod.outlook.com.

--_000_AM0PR05MB6018FE1A28FCA35C3D120C03A9189AM0PR05MB6018eurp_
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">H=
i Andrej and Ralf,</span><br>
<br>
</div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);">Wow that's a very weirdly specific bug. But It's am=
azing! Thank you, guys!</span><br>
</div>
<div><br>
</div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);">(Still intriguing why it happens only with Jailhous=
e, but not on baremetal).</span><br>
</div>
<div><br>
</div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">C=
heers</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">K=
arim</span><br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Andrej Utz &lt;andrej=
.utz@st.oth-regensburg.de&gt;<br>
<b>Sent:</b> 05 December 2022 16:28<br>
<b>To:</b> Ralf Ramsauer &lt;ralf.ramsauer@oth-regensburg.de&gt;; Karim Man=
aouil &lt;Karim.Manaouil@ed.ac.uk&gt;<br>
<b>Cc:</b> jailhouse-dev@googlegroups.com &lt;jailhouse-dev@googlegroups.co=
m&gt;; Henning Schild &lt;henning.schild@siemens.com&gt;<br>
<b>Subject:</b> Re: [EXT] Jailhouse: unhandled APIC access when booting a L=
inux guest</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">This email was sent to you by someone outside the =
University.<br>
You should only click on links or attachments if you are certain that the e=
mail is genuine and the content is safe.<br>
<br>
Hi all,<br>
<br>
On 05.12.22 15:41, Ralf Ramsauer wrote:<br>
&gt; [Adding Andrej]<br>
&gt;<br>
&gt; Hi Karim,<br>
&gt;<br>
&gt; On 05/12/2022 13:30, Karim Manaouil wrote:<br>
&gt;&gt; Hi Ralf,<br>
&gt;&gt;<br>
&gt;&gt; I am trying to boot a Linux guest (based on<br>
&gt;&gt; configs/x86/linux-x86-demo.c).<br>
&gt;&gt; I tried to debug and solve this issue for a while but no success s=
o far.<br>
&gt;&gt;<br>
&gt;&gt; The cell is created, and the guest starts booting, but then fails =
when<br>
&gt;&gt; initialising the APIC. A write to an APIC register is intercepted =
by<br>
&gt;&gt; Jailhouse and it decides that the guest is trying to set an invali=
d LVT<br>
&gt;&gt; delivery mode. I checked the x86 documentation, it seems that it<b=
r>
&gt;&gt; should not be invalid, but I am not knowledgeable enough.<br>
&gt;<br>
&gt; Sound familiar=E2=80=A6 I remember that Andrej and I have hit this one=
 on an AMD<br>
&gt; machine some years ago:<br>
&gt;<br>
&gt; <a href=3D"https://groups.google.com/g/jailhouse-dev/c/1wRKIiGN0GA/m/_=
p_NSIBpDwAJ">
https://groups.google.com/g/jailhouse-dev/c/1wRKIiGN0GA/m/_p_NSIBpDwAJ</a><=
br>
&gt;<br>
&gt; Andrej, do you know how we finally (quick?)-fixed that issue back then=
?<br>
&gt; Did we really have hardware misbehavior? It's been a while, but as far=
<br>
&gt; as I remember that was the case.<br>
<br>
Afaik it was a CPU bug.<br>
We had to apply the attached patch to the kernel to make it boot as guest.<=
br>
<br>
Thanks,<br>
Andrej<br>
<br>
&gt; Thanks,<br>
&gt;&nbsp;&nbsp;&nbsp; Ralf<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Here is, pasted below, the log output from Jailhouse and the booti=
ng<br>
&gt;&gt; guest kernel.<br>
&gt;&gt;<br>
&gt;&gt; PS: I am following the steps in Documentation/non-root-linux.txt a=
nd<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; using the patched =
kernel in queues/jailhouse branch.<br>
&gt;&gt;<br>
&gt;&gt; Cheers<br>
&gt;&gt; Karim<br>
&gt;&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; Jailhouse:<br>
&gt;&gt;<br>
&gt;&gt; Cell &quot;linux-x86-demo&quot; can be loaded<br>
&gt;&gt; Started cell &quot;linux-x86-demo&quot;<br>
&gt;&gt; CPU 2 received SIPI, vector 100<br>
&gt;&gt; CPU 3 received SIPI, vector 100<br>
&gt;&gt; FATAL: Setting invalid LVT delivery mode (reg 35, value 00000700)<=
br>
&gt;&gt; FATAL: Unhandled APIC access, offset 848, is_write: 1<br>
&gt;&gt; RIP: 0xffffffffaf84fb92 RSP: 0xffffffffb1003e80 FLAGS: 246<br>
&gt;&gt; RAX: 0xffffffffaf84fb90 RBX: 0x0000000000000180 RCX: 0x00000000000=
00000<br>
&gt;&gt; RDX: 0x0000000000000000 RSI: 0x0000000000000700 RDI: 0x00000000000=
00350<br>
&gt;&gt; CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1<br>
&gt;&gt; CR0: 0x0000000080050033 CR3: 0x000000003ae0c000 CR4: 0x00000000000=
406b0<br>
&gt;&gt; EFER: 0x0000000000001d01<br>
&gt;&gt; Parking CPU 2 (Cell: &quot;linux-x86-demo&quot;)<br>
&gt;&gt; Cell &quot;linux-x86-demo&quot; can be loaded<br>
&gt;&gt; Closing cell &quot;linux-x86-demo&quot;<br>
&gt;&gt; Page pool usage after cell destruction: mem 2972/32211, remap<br>
&gt;&gt; 65703/131072<br>
&gt;&gt; CPU 2 received SIPI, vector 96<br>
&gt;&gt; CPU 3 received SIPI, vector 96<br>
&gt;&gt;<br>
&gt;&gt; Linux demo guest (last few lines from kernel boot log on the seria=
l<br>
&gt;&gt; console):<br>
&gt;&gt;<br>
&gt;&gt; init, 1176K bss, 73676K reserved, 0K cma-reserved)<br>
&gt;&gt; [&nbsp;&nbsp;&nbsp; 2.960440] SLUB: HWalign=3D64, Order=3D0-3, Min=
Objects=3D0, CPUs=3D2, Nodes=3D1<br>
&gt;&gt; [&nbsp;&nbsp;&nbsp; 3.040332] Dynamic Preempt: voluntary<br>
&gt;&gt; [&nbsp;&nbsp;&nbsp; 3.083151] rcu: Preemptible hierarchical RCU im=
plementation.<br>
&gt;&gt; [&nbsp;&nbsp;&nbsp; 3.151749] rcu:&nbsp;&nbsp;&nbsp;&nbsp; RCU eve=
nt tracing is enabled.<br>
&gt;&gt; [&nbsp;&nbsp;&nbsp; 3.205830] rcu:&nbsp;&nbsp;&nbsp;&nbsp; RCU res=
tricting CPUs from NR_CPUS=3D64 to<br>
&gt;&gt; nr_cpu_ids=3D2.<br>
&gt;&gt; [&nbsp;&nbsp;&nbsp; 3.284872]&nbsp; Trampoline variant of Tasks RC=
U enabled.<br>
&gt;&gt; [&nbsp;&nbsp;&nbsp; 3.345191] rcu: RCU calculated value of schedul=
er-enlistment delay<br>
&gt;&gt; is 100 jiffies.<br>
&gt;&gt; [&nbsp;&nbsp;&nbsp; 3.436710] rcu: Adjusting geometry for rcu_fano=
ut_leaf=3D16,<br>
&gt;&gt; nr_cpu_ids=3D2<br>
&gt;&gt; [&nbsp;&nbsp;&nbsp; 3.518471] NR_IRQS: 4352, nr_irqs: 424, preallo=
cated irqs: 0<br>
&gt;&gt; [&nbsp;&nbsp;&nbsp; 3.585483] rcu: srcu_init: Setting srcu_struct =
sizes based on<br>
&gt;&gt; contention.<br>
&gt;&gt; [&nbsp;&nbsp;&nbsp; 3.667665] Console: colour dummy device 80x25<b=
r>
&gt;&gt; [&nbsp;&nbsp;&nbsp; 3.720639] Enabling UART0 (port 0x3f8)<br>
&gt;&gt; [&nbsp;&nbsp;&nbsp; 3.766423] printk: console [ttyS0] enabled<br>
&gt;&gt; [&nbsp;&nbsp;&nbsp; 3.766423] printk: console [ttyS0] enabled<br>
&gt;&gt; [&nbsp;&nbsp;&nbsp; 3.866333] printk: bootconsole [earlyser0] disa=
bled<br>
&gt;&gt; [&nbsp;&nbsp;&nbsp; 3.866333] printk: bootconsole [earlyser0] disa=
bled<br>
&gt;&gt; [&nbsp;&nbsp;&nbsp; 3.985019] APIC: Switch to symmetric I/O mode s=
etup<br>
&gt;&gt; [&nbsp;&nbsp;&nbsp; 4.046377] Switched APIC routing to physical fl=
at.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; The University of Edinburgh is a charitable body, registered in<br=
>
&gt;&gt; Scotland, with registration number SC005336. Is e buidheann<br>
&gt;&gt; carthannais a th=E2=80=99 ann an Oilthigh Dh=C3=B9n =C3=88ideann, =
cl=C3=A0raichte an Alba,<br>
&gt;&gt; =C3=A0ireamh cl=C3=A0raidh SC005336.<br>
</div>
</span></font></div>
</body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/AM0PR05MB6018FE1A28FCA35C3D120C03A9189%40AM0PR05MB=
6018.eurprd05.prod.outlook.com?utm_medium=3Demail&utm_source=3Dfooter">http=
s://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB6018FE1A28FCA35C3D120C=
03A9189%40AM0PR05MB6018.eurprd05.prod.outlook.com</a>.<br />

--_000_AM0PR05MB6018FE1A28FCA35C3D120C03A9189AM0PR05MB6018eurp_--
