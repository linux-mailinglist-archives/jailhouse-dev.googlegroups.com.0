Return-Path: <jailhouse-dev+bncBDGILGE54ELBBHV75T7AKGQETS2TLAI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1D02DCE0E
	for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Dec 2020 10:06:39 +0100 (CET)
Received: by mail-ed1-x53b.google.com with SMTP id e11sf13170206edn.11
        for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Dec 2020 01:06:39 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1608195999; cv=pass;
        d=google.com; s=arc-20160816;
        b=PboT2gi4cz+2wsCjwzLvTkYW+CcZFDIWn8hUfvdBIJ2Ts5w5ByfIjDW1bxZDslJGG/
         0YQlh2eXqFTiTOI4TndoeFsrnai8OV8ouhuwRq8cob5QY/BFlntu/2oBX1vkyGovmySh
         DYmf3Ha5Xc8YIJqIY+i2v7m3mA90BkqSMzmFLGjEcjturSUgatCNp5+RurkCTpbIBJW8
         ArGfaQbI1Kg2nPqy+G/MOGdqsW/fwmVmI0EAGjjMTPHQHB0H+94xff9/ZzELkxs7kPLT
         aJqOfrk4QScPkfe6dfHbucp1DQ/55UZpRxekZNdLqyzOKhE7vpYsuTfxjotOyL8oHjyw
         GWgg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=UFWbJ4tSVa9ywQS7SNSmvYHm1KvEpvq6TSya3Jf5TZE=;
        b=EfYYI982T1gQanWc0ikR5qmF+OurGNRFKk4BdfkcKpnGXhhsKKByPjKZQVpEaABfMk
         /5zX1w98u7yYdnA8lvIB3z7sMlGKtzXW3g4YOhhw0dA0URR966mn5Za00IamqLhyquZh
         dbQcwssgAekFs8VBqHNAUquaAqgiJlLYKWPHKIxgq8w/k0f0dzIaadLdZ5mTas0YPzBh
         5WbA0hJDU3SS2/i4ChdKtFUbaPgzm7m/q/IYbOnfRYv0ChANZ6gZtGYeQxdBSkMvI7sF
         Drs0ORdwOADLJnQnsrHFLU1If75HhlpqHAJqwkpqQVQKakgkgs0BC9qY6wDJJV6mwd1L
         F4FQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=bEspNqdR;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.0.102 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UFWbJ4tSVa9ywQS7SNSmvYHm1KvEpvq6TSya3Jf5TZE=;
        b=c/qBsRRgydshJVtvRrbsPatYFK/xKigf2Wk1FArszJtOqE+E6U5MwWq+HShDWYgJ3n
         zSScIq7IuRxXKpCF+VmXds66cxNHLuvfInroCT6LwsvcJ1N/w6f1hJRM8BSTXBXqTYOF
         T1Rw1FIj7+phxqXgCUxhEqyPUrgP9tzhXcN7CwUlJqSf3ita6O+auyer8Scscr0hktmk
         Be7roxLSKhZfoRFyGUA5//KN3EtgmIFtqHJ6tiWXIkA2w9xGX2JE3OUGXGuy2y5KsqCo
         avql8oxjSCelOpgL7CqcI4fQbw9SXLvBb/TQPMdZygAgyeqmS8ubVy7RxQyJUEskVTxP
         tg5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UFWbJ4tSVa9ywQS7SNSmvYHm1KvEpvq6TSya3Jf5TZE=;
        b=RNCAXeyNB7wL4bmKc5eIbMw9D3vCHi0CBXD/Hx9pbw3Q9SiEPp0v1KCvd+PkWLkNZx
         1UZtXxCVIuGAPlOAVbWZs/10wYa9iFnu56fzIbt/iquLRjsAoy2fE1x/f2SISOxtPPO7
         qQDiNgB46oOzIqyFyl/rbTP3IS3geexL8F/NUIe79x8cnVksY0j2BkkpvQVE0LADGvGI
         vDjIfUktg9NDsz2/KOcauTpUZv4KvO6DVCxpWzJ1s6EibTMfG8/wVzQ73Tdh1QtIgjJI
         EuaWBqUekYubwF5m8PyYowLjZRPcNnzdAlHJfwgCtaLEOa6DrvW2Li2onkUVKn6WQN0H
         Dh6A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531VBvqtb129gaQ7HYWJhy5Drkkx+D6ILLef2dH9utmhIT3oR4lT
	He0FGW9WTUYIQs3mf2LpOFY=
X-Google-Smtp-Source: ABdhPJzvD/CocRyOwlD468dUQiuEr9F+Yw6oCy0QnbRuLnehCn79WVnLB+Ll6bJ1FafS8JQu2ikuFw==
X-Received: by 2002:a17:906:e212:: with SMTP id gf18mr35068158ejb.551.1608195999396;
        Thu, 17 Dec 2020 01:06:39 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:5a96:: with SMTP id l22ls3311698ejq.7.gmail; Thu, 17
 Dec 2020 01:06:38 -0800 (PST)
X-Received: by 2002:a17:906:fa8b:: with SMTP id lt11mr12348814ejb.94.1608195998307;
        Thu, 17 Dec 2020 01:06:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1608195998; cv=pass;
        d=google.com; s=arc-20160816;
        b=hqx1PbF2OskAwISZBncDCuxHMXwdvnGe0L/ziHLD6+ckobsQVXiL2dkc+zOdJTw208
         lLDpDna2Blj4Cpb+US0CJRUkxAdj3AIpi08mLmDHbOYWLft9JFVso5zeqbLjSVO3pLcn
         /dZue3E6CLS3mVs2DozWhsXF21qz6+N6re8/GEcAzX00dvZxoDnOurea6hx0rNXUYCsR
         DKfJ3onGom2LJy9klvnGJ6Zzi6bFF6wX4MweVpE0m40PDzUNgqg1qgqax6LCNcvbQuXZ
         0Jl7jViqpaKFdbrdWM5sSESPK3QOdOlaPh+E6qeSjDJQ+eEDsxsEYtgVJ6aIW3Qd/qld
         slSA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=uyBp3zVMHM8TOmUydzArnxkcNK8zPaCIttH0SBQ01G8=;
        b=HFHvAmUmP+fio9Y+6WidWwLd+0zrXKPeEYpfzyL35pvBcHzNjFWGYn8/KCFdUzfyBn
         x/Ugs3izqeHhLZzeHQ6le9ieKObyNNyRCJuzEhmDZiXh00QbXdds1xzqUigyKyeTTSEM
         i4J3RtWulGkG2AD8J+hNTXSFAovg/bzH6c35IKQ4+1zncDCbejXcsFv654fm18ZJ/Lqn
         I1QTmsGByuoAeTeMRGraZSAMpuoMqXhQPteAqo45vKBRAHfdh6xitJQpYw4QTptOoyz4
         keiJG1QFu+NWVxhEkvZ7WZKW1+WsVFySSvrR0QDA40wd0wwxXi2vTnp/4Sksccp/MNiU
         9zHA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=bEspNqdR;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.0.102 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00102.outbound.protection.outlook.com. [40.107.0.102])
        by gmr-mx.google.com with ESMTPS id v7si435682edj.5.2020.12.17.01.06.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Dec 2020 01:06:38 -0800 (PST)
Received-SPF: pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.0.102 as permitted sender) client-ip=40.107.0.102;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N0CHLkotYczSFDPTof05//Zr7IhW9V69vZnbgAuoJ8CHUuD92mitgDmgucA90Wn9850v8Jstg37fxyZSQnG+oi8wqhqfKAXh+OnRguCrXxAWWVjknqYqSdmF33qRdLBpDgAqMLlu4EJZM0bMN0BK+swrNaCXKGG0e4jb30rPxwF+CUsv0YZxqBjROXSXhtfBBz+NmZcm60jAkofCvQzCMD90JFFAuuE0lLmcuPvCmEttIJEFufKF2+khtJPvFZ4MjrDKtStBf17nDvBy6Qp/H+pPbzSTQmAuZ8YtLlQ5bHQIMj+BkwAtaQbgz820QJUc0Tv6EvARlp8UkxtF4Amzeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uyBp3zVMHM8TOmUydzArnxkcNK8zPaCIttH0SBQ01G8=;
 b=XS+yMXTb6egWn1VB64LGBDkKMw1X1ZttJp+c5WcHXO7PsUOUFWqHBxl6BW/3BzalIBTD9NsALj6oCaflSCyJBJteiHueoKkZSJ0L35k97j+gMND3fZCHPeNPIReCmxGwVpCzDzYH1AWMAyl0AsRiCwxJMb8/KBsM/DPlooOCcDJLOf4Jpx86DSRKydESlXwSXTK4DPTbS89GmwWKTBoPJoLFaiVDbrGGUvYotvolsQ9Z/fm1jadwpjMJJFa0F2YLoBJMS+Rr7lMX8YG7TWI/0knnE86LzRjEh5NJgKeBd7FkbD9Wgt52V2XfrWjRAN+WFYLM7HfLn/yYTbCj1OUMIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com (2603:10a6:20b:257::14)
 by AS8PR02MB7110.eurprd02.prod.outlook.com (2603:10a6:20b:2ef::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Thu, 17 Dec
 2020 09:06:36 +0000
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::8853:89c2:5d61:669a]) by AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::8853:89c2:5d61:669a%7]) with mapi id 15.20.3654.017; Thu, 17 Dec 2020
 09:06:36 +0000
From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Andrea Bastoni
	<andrea.bastoni@tum.de>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: RE: Jailhouse Installation Feedback
Thread-Topic: Jailhouse Installation Feedback
Thread-Index: AdbPAqXumcu/noOAQZOoHctg4uYP8AErZm+AAAs10QAAGoovgAACzr7g
Date: Thu, 17 Dec 2020 09:06:36 +0000
Message-ID: <AS8PR02MB6663C550FA3DE433E275B238B6C40@AS8PR02MB6663.eurprd02.prod.outlook.com>
References: <AS8PR02MB6663A103382B6B698EB2B7EBB6CB0@AS8PR02MB6663.eurprd02.prod.outlook.com>
 <200a59b2-8745-099a-4172-a29dcd22c65e@siemens.com>
 <64c38e90-8dc5-9b2e-804d-3a098825f7d8@tum.de>
 <41648862-80b5-adf0-570f-79397bd80435@siemens.com>
In-Reply-To: <41648862-80b5-adf0-570f-79397bd80435@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.127.64.7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 021cc9e5-63d6-41ab-5a0e-08d8a26b0ee1
x-ms-traffictypediagnostic: AS8PR02MB7110:
x-microsoft-antispam-prvs: <AS8PR02MB7110A24848BA98FFE69009ADB6C40@AS8PR02MB7110.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VHgAfRTZveikb9kSt8Uf2t82qL7Gm87UPvTd7oUmMR6Na9/VYliwAh/9+2nb2b8pUFG8+SXGOwQrLFW3/ozKcwikx4Rx0sxd48TtM+rX06qJhhnIu2bdsKSq8bWFQPZbiTwGWVXyflhAExpmFSidSyFIryfSreFJj8CpIAwhAZ8xJ5VZyr0vTMD+2n5Lg3vXcNHaElWjD6KiO1GbXI+fupVR9SGZguYelRzo7NFcBkkjEDF2z45RBGnA5VQAVtOuxAA0MmxHXCmP3OxgdQHVoqmEFf73ojamNltlY2ncsNXYISg+QyAgONndG6YzlxWs3OD0LKf+CBjqXj9eMDSDYQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB6663.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39840400004)(346002)(136003)(396003)(9686003)(71200400001)(26005)(33656002)(66476007)(66446008)(478600001)(3480700007)(55016002)(316002)(6506007)(2906002)(5660300002)(8936002)(110136005)(66556008)(53546011)(83380400001)(76116006)(66946007)(7116003)(86362001)(186003)(52536014)(8676002)(7696005)(64756008)(44832011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?OFFOR0x6dlo5dGRRQmsxT0YxUng0YnRTTkYwZWxZTmNJQS82OU9rL1hjcDVO?=
 =?utf-8?B?c0EzbVZyYVVEelVQbkIvOTVBMXRxaCsraFp2RzJGNWREclg2R3Z4SExqYWQ5?=
 =?utf-8?B?ZDlKcmFLYUlBaHdUeHllQ0hVYVRHSHA3d3NpbDc3QjR3eS9zTllOSTRaSUtV?=
 =?utf-8?B?LzhXeUoxQTlmOWpJL0d6TGVHcC9yU1lvU1FRb2N1bTZGYThNM3FydEUxc2pn?=
 =?utf-8?B?SjBjR1B5Z2phbUE5L0ZrSjQzcmZZVWJudmI1czkxMjNOVHVCUGxOY3dsN1E5?=
 =?utf-8?B?Y2diQWhxcE1BOTlsdXNlSHp4MFprUWhMYmg4WEVndFFYT2NiTGpJZWFtcnhP?=
 =?utf-8?B?Z2tHRWNObi9wQXdqUHVZOHI5NFpBMGVuVW9JWk93RU03NlhFRTVYdWRkYUtk?=
 =?utf-8?B?OVp0a0loNUYwbHUxWVFMa0pXUXVXUUxHMkZCZlE5WVoveEh1ZkRnay9oc2ZB?=
 =?utf-8?B?bndySHlqV042NGxyaTFjZUFCcnhGS2lEb1cvakJteVNTdHA0QlJ0dkgzTlNS?=
 =?utf-8?B?WUxqZHhqMW91d01rQkt3Z2RzQnhNWUgySm5jSkRNZnJWT09CblRSUm9jeWx3?=
 =?utf-8?B?bnk5eDRFQ0VQMklSd1l1RnJsRGFhL010WEZISVZGOHFjVVc3d0VQOGptYlJX?=
 =?utf-8?B?VTMvRU1qVmp1cFhTTDUyVXNkbXp3NzlHOE43MmRnK2ZKRzN2ZVNSeEFoUXVi?=
 =?utf-8?B?VFA5dTN2Zkoyc2k5N0MwQjNJU2FCbmQvL1NkazJzTVF6MytnajRIMmQvVFJ3?=
 =?utf-8?B?Vld6bDZrN0xaMXVZM1FpS0NNQ2VpSG5vTnJWSTdlL21KQjk3TnVqTTJtbXR1?=
 =?utf-8?B?dWRtVkxySzFJWVh5V0xBNkxOWGRWT3NEcDhXOFRGdDI4Sk11MnBML2VQWGc5?=
 =?utf-8?B?Z0lwdFRYeVdQV3BjUlJCbzlMVmdNZHR4clByampnYjg0dEJEa3dMSjUrSzJN?=
 =?utf-8?B?Q2VneUw0RVdsZnMvSjB6bis5cXNBWnMxME5KNUdUM2k0ZlZJYW1OQ0FvOGZC?=
 =?utf-8?B?ZGFLK2FwOTVoNEkzc1dtNCt5WVNMWjV5RnRIakNsZVhUWUEvZ1BJUkNGZE5K?=
 =?utf-8?B?d0xQUkF4STdLaGtpY2RrN04vY3VsRE5taWY4ek04aTZjS1IzNHJPcFhGTG1u?=
 =?utf-8?B?bEpKSWYxUDB6eVpjYk0zY3dqeUFyakdyejlmOHR0Y3pMUkpXRkRSWmE2Qm5N?=
 =?utf-8?B?SVNXUzZQTXNrb3FEZGdXREdvZUVhWWxQVHhwUFpBcnhZeVBkbFRlV1ZySUx1?=
 =?utf-8?B?OFdaakJGeUZ5VS9EZ1FGemNQMHpUcDJnRzlMeFN6ZnJoTHFMeHIwbCtUb3pu?=
 =?utf-8?Q?CF8i98d3Aq9SE=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB6663.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 021cc9e5-63d6-41ab-5a0e-08d8a26b0ee1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2020 09:06:36.6680
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X8BSsqQy38PMHlPcHUuoxLJ/NB0EtHwijr2RAY9zTZD9mAJbAw+IqFGxhB1K3olDi4j2c8k8+onAbCUI7Mpo70BPmx2jAabMccAqE843WIkTpa4tHMl+i76jhmnVbHRM/KIjW7oXxQt4Vt1DWhGusA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7110
X-Original-Sender: bram.hooimeijer@prodrive-technologies.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@prodrive-technologies.com header.s=selector1 header.b=bEspNqdR;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass
 dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com
 designates 40.107.0.102 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
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

> On 16.12.20 19:55, Andrea Bastoni wrote:
> > Hi,
> >
> > On 16/12/2020 14:34, Jan Kiszka wrote:
> >> On 10.12.20 16:20, Bram Hooimeijer wrote:
> >>> Dear Jailhouse community,
> >>>
> >>> Over the last days I have been trying to get Jailhouse running on real
> hardware. I ran into quite some issues, but managed to get it running
> eventually.
> >>> For some issues, I was able to find a solution somewhere in the mailing
> archives, but not for all of them. So I thought I'd share my experiences here
> for future references.
> >>> There's also some solutions which are not entirely clear. If you have any
> reference on that it would be welcome, but I understand these might be
> very system specific as well.
> >>>
> >>> ** Installing Jailhouse **
> >>> * Installing Jailhouse on generic Ubuntu (2.10) gives the following error:
> >>>> ERROR: modpost: "lapic_timer_period"
> [/data/ecseqm/jailhouse/510_siemens_jailhouse/driver/jailhouse.ko]
> undefined!
> >>>> ERROR: modpost: "__get_vm_area_caller"
> [/data/ecseqm/jailhouse/510_siemens_jailhouse/driver/jailhouse.ko]
> undefined!
> >>>> ERROR: modpost: "ioremap_page_range"
> [/data/ecseqm/jailhouse/510_siemens_jailhouse/driver/jailhouse.ko]
> undefined!
> >>> I believe some of the kernel symbols have been renamed in I believe
> 5.8. As a solution, I switched to 2.04 LTS (Kernel 5.4), where it installed
> without issues.
> >>>
> >>
> >> That used to work by luck for some kernels via ksymall, but that is
> >> disabled in other kernels for security reasons - and now even removed
> >> from upstream. You need some patches from the
> >> github.com/siemens/linux
> >> jailhouse-enabling/5.4 queue (or queues/jailhouse for the head queue,
> >> that's on git.kiszka.org).
> >>
> >>> ** Enabling Jailhouse
> >>> * enabling a compiled sysconfig.cell results in:
> >>>> JAILHOUSE_ENABLE: Invalid argument
> >>> with dmesg listing:
> >>>> jailhouse: Not a system configuration
> >>> This issue was already reported on the mailing list, but I'd like to note
> that it was not a singular case. Switching from GCC-9 to GCC-7 solved the
> issue for me too. I guess GCC-9 takes the freedom to move the header away
> from the initial memory location, which results in Jailhouse failing to verify
> the .cell to be a system configuration description.
> >>>
> >>
> >> If that isn't solved in current next, we should address it. The
> >> proper fix is moving away from gcc to a different way of compiling,
> >> but that's another story.
> >
> > If it's the same issue that was reported in October ("Jailhouse in
> > qemu and ubuntu"), then maybe the attached patch could help.
> >
> 
> Likely. Could you send the patch as a regular one to the list? Bram, could you
> test that and give feedback?

Thanks Andrea, Jan. I can confirm that the patch solves the issue on building .cell configs.
For inmate binaries, this was not an issue in the first place, as I believe jailhouse_cell_load does not check this header for cells. 
However, it might be sensible to strip the gnu.property section from both for consistency. 

Bram

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AS8PR02MB6663C550FA3DE433E275B238B6C40%40AS8PR02MB6663.eurprd02.prod.outlook.com.
