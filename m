Return-Path: <jailhouse-dev+bncBD7KJ5F42UDRBGEX2LTAKGQE5GCMI7Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 9887119350
	for <lists+jailhouse-dev@lfdr.de>; Thu,  9 May 2019 22:20:40 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id u124sf2647498wmg.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 09 May 2019 13:20:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557433240; cv=pass;
        d=google.com; s=arc-20160816;
        b=FT3kg0SZvutkXz4OEt+NoqYARExNza2BxZZ409NMLtXnixPiEm1I31ZOYHRRGauGi7
         oMzKidURVJEMy/x3VAGNXrkAaWY4jPce5gzubBtZX61iZGvntcQgbigjD/y9kybQNEYa
         k3aQ3T4GspI+1m4xSakdfwvp1ywy/QrwyNOXRi0z2CR3qzkN2ZpApDVVSrSoXQ5IpWQ1
         AmzBu2eVB3aPTykFD1DUiB3NiC73FWYn/VpZ8zP8i4f56XrOspiFF9jAUHg6Hq6XfkCe
         j8ZwAY73VE4ux3RMojel2kyufb4hfE5GqNIyqLwvHJ8ljNLyhq0srpKadID3lgPZ+0u0
         yeuQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=nQRPfAehbSjcwZAFhU+Y+opqnRfhxASgOUBUzVAWmCc=;
        b=iBZtOUqXXgngtoeqi09Pv54qpr5Ca3Q8YWLC0e9v+7JDztl4MUBUfC3M+J9tR55qf3
         W8VFcM34TUlTh57d6u68mt589rszNPJKrlrFhl74jYiczQhxg9UpqePlDneEOeS+tBUi
         Xihpx1c69PQ62I8Fb3t+tXy1/xIYNA5/+rOpf3sqFfos9NlEoU6mYDcJtkFG06Rj8TrD
         jiAKwmMMHuy74O0ltyWpz2rPwYeDoqNrCTb5Ot4+i+wEp912KqSBSJzgAuNj9fUnZOcg
         YZr9N+wXRRQLCTIv7mrPdrKYqXgrpmin3aDRyyX3nFuVk6+OmHYCDlWOVfjwjTEuWEME
         wkyA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@Softube.onmicrosoft.com header.s=selector1-softube-com header.b=REDcRG1J;
       spf=pass (google.com: domain of arvid@softube.com designates 40.107.13.90 as permitted sender) smtp.mailfrom=arvid@softube.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language:content-id
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=nQRPfAehbSjcwZAFhU+Y+opqnRfhxASgOUBUzVAWmCc=;
        b=ahQCXgnmgJ3J5Xy2+X36qvynmpDYdmCEsjim76/gcTFT/4X/WBYCiAcrxK2810xLam
         +5ze+Pz94cS+hTSoaILdku5+b5lfD0Fr3zxLJ7Te5d7Q8Ja3PEHpTrWwKoYchscoSlFo
         /BhStvHxtUfvA8jRvcD3JoaewXHtXAYic3+jQeQxl5RPM/SB9w1Q3rNXaS34JXnNvjjK
         fxLi8pygsr2I6BaOjI+sjxzgl/D6ldg9G9Vrga1lqpmx4sxvkV15nbnPqPc1158lCzU7
         ih2giXXvltYYsjScH5Z42dRtBOLpIqxoMF2UtqnSiLpw0cMEg+03ZK197VXdh4mjv+G0
         W79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-id:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=nQRPfAehbSjcwZAFhU+Y+opqnRfhxASgOUBUzVAWmCc=;
        b=sT04vPi8r2LGMNAswuRwe4JuuBR3BdZg8AIrTztrOUlyjS36XQL1+pCStkNm3+FC34
         fhL8jaNLSQCWZP1niz7bEkw6RNQgfTAPtUES0N+Mz6x5T1d6cVM24+bDAlLGVDQKl3cc
         cMlqN4unGRt5X87ntgNfx0O8HSbX1v1jH0vRpxlc/aQ67dGgCWBtMov8kPfqPfMwe30P
         dMTcWLg99GNmqpnnHHikfLdjwtxmEvS03yEu8x5oSXHPM+C1JayxhKfIMcn8NBnWjauF
         S3mEqOERaqihfmS2Xk0NPf2GzU+aHv9j7DFyQHy0vhrpxZP5raIwvMOunWm7Zv+e/p/e
         sLUw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWPrJqfzcOcp71wnL0h/qVFz0h/8w8H+2eX5C691vTAErsQ1LfE
	oB3Nu05GYBqh+i1OiWIM3qQ=
X-Google-Smtp-Source: APXvYqxGBFbXzvVwuW+swp7DnLwmQUkyGT+6n613nDSSl/e7Ug2xlq+y/PBbNn0+r2LfDfarFUAPhg==
X-Received: by 2002:adf:fc8f:: with SMTP id g15mr4885547wrr.122.1557433240363;
        Thu, 09 May 2019 13:20:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:db81:: with SMTP id u1ls823093wri.14.gmail; Thu, 09 May
 2019 13:20:39 -0700 (PDT)
X-Received: by 2002:adf:b645:: with SMTP id i5mr4765076wre.272.1557433239856;
        Thu, 09 May 2019 13:20:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557433239; cv=none;
        d=google.com; s=arc-20160816;
        b=eAlUcMETzIRs0uCol7nOr/XsChNyyuy6lZi5/C5s5CUrXXbaL1YvQOOOyPi1EQb9WS
         i79oUbRb2eirRdl3psPl9J+qi5CtrlP65ns8waCmr/o+g3kSlXYhiD/KgTSWDGtVKnji
         AK5iojSXQIrJ5I5vHo71Cw8ePZBhtFAMZ249EaCUQ1P44p7mg3VeWplM1vVHiSex1PT/
         diLayJu1qclbouFAo0chHEoua3jU+6jTqFaM00WkQ1R2DqFKhDx5tZuHS8Y0JpTdwLrT
         yMzUW7ALMIXGTwzImAltoo0YpMH8QfuGNJhxmjPizXhGWhLXa/CMYUWYdcKf61QE+9w+
         5gZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=UMATs/sw9gV/VhgNURAFbKBcBkaP3jz0CB5gVOMzxpc=;
        b=O7VLZJtNpPjHz4HISwxXlKRPpHUQzJq/dH0hsghhqezyxrIaHcHOC9Xr+PQqqA0n8o
         eolXXj9Ao1CXyfLQJ8HXoYifZEvGf/tenl3r2olQagkHi+WCjRi2YD4KXLZbVCk/tndO
         CLJT+77JCMT/TCU9wirx1pyqrc9V66MlYE5vk07XP/PdI9QNUUMTLvNP42vIsZNFSegF
         yHNOHb5Q+BgRYhBhfQaMydmPgZXm7bILv3mz9IKmIAwK+PzaG47WqrVYj4NfyNSBWCsh
         qax0T7kiNWDWKeyaYOQJnUHCPn/p/yKy7KC5p2IOJw4eafI9Ff3W2AbxIySpHWm2IINK
         nsJA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@Softube.onmicrosoft.com header.s=selector1-softube-com header.b=REDcRG1J;
       spf=pass (google.com: domain of arvid@softube.com designates 40.107.13.90 as permitted sender) smtp.mailfrom=arvid@softube.com
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130090.outbound.protection.outlook.com. [40.107.13.90])
        by gmr-mx.google.com with ESMTPS id u2si1014322wri.2.2019.05.09.13.20.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 09 May 2019 13:20:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of arvid@softube.com designates 40.107.13.90 as permitted sender) client-ip=40.107.13.90;
Received: from HE1PR0201MB2332.eurprd02.prod.outlook.com (10.168.150.22) by
 HE1PR0201MB2188.eurprd02.prod.outlook.com (10.168.29.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Thu, 9 May 2019 20:20:37 +0000
Received: from HE1PR0201MB2332.eurprd02.prod.outlook.com
 ([fe80::69ad:976d:5122:6b96]) by HE1PR0201MB2332.eurprd02.prod.outlook.com
 ([fe80::69ad:976d:5122:6b96%8]) with mapi id 15.20.1856.012; Thu, 9 May 2019
 20:20:37 +0000
From: =?utf-8?B?QXJ2aWQgUm9zw6lu?= <arvid@softube.com>
To: =?utf-8?B?SGFra8SxIEt1cnVtYWhtdXQ=?= <hkurumahmut84@hotmail.com>,
	Jailhouse <jailhouse-dev@googlegroups.com>
Subject: Re: Building on Orange Pi part 2
Thread-Topic: Building on Orange Pi part 2
Thread-Index: AQHVBppHHinIiqNX3E6acQP8uXAbqaZjNDUAgAApbwA=
Date: Thu, 9 May 2019 20:20:36 +0000
Message-ID: <E34A3AF5-43A8-4C94-BE2B-7A9A033B7D22@softube.com>
References: <B9572A15-BD81-4DAE-9052-931E11167750@softube.com>
 <c0798a91-b54e-4817-bb1a-9f97ba7ceeea@googlegroups.com>
In-Reply-To: <c0798a91-b54e-4817-bb1a-9f97ba7ceeea@googlegroups.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [81.230.58.122]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7717d78-40e0-4530-9d34-08d6d4bbcc43
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:HE1PR0201MB2188;
x-ms-traffictypediagnostic: HE1PR0201MB2188:
x-microsoft-antispam-prvs: <HE1PR0201MB2188777E0C063134DDD63258A1330@HE1PR0201MB2188.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(366004)(396003)(136003)(39850400004)(199004)(189003)(6512007)(11346002)(476003)(6436002)(76176011)(110136005)(5660300002)(99286004)(6116002)(3846002)(36756003)(6486002)(14444005)(256004)(5024004)(86362001)(6246003)(53936002)(83716004)(66066001)(71190400001)(71200400001)(508600001)(25786009)(229853002)(7736002)(305945005)(316002)(82746002)(14454004)(446003)(486006)(2616005)(53546011)(6506007)(73956011)(76116006)(66556008)(66946007)(66476007)(64756008)(66446008)(26005)(102836004)(33656002)(8936002)(8676002)(81166006)(81156014)(68736007)(85202003)(2906002)(186003)(85182001);DIR:OUT;SFP:1102;SCL:1;SRVR:HE1PR0201MB2188;H:HE1PR0201MB2332.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: softube.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TK2nR8UoJ0/EH7UBPjmxMVXVLa+mAMbF1QJLTTZ13PCUg+WlkEMiqqMbtcqHzgS8AxuyL2dzhu5xM26/1T3IAIAOjpIQnq19bUhO7w6lSM9C0tmzem2cUMRkHPxYWv6LOnlCScTZ32HifOhzgegVf3ab6RW+ZsIPFIIZQzStXl3e+uDozWewFnQvPpqYt+UQs8zrCpNWoxbUIAOf+NIpqJ08aPJ7g3+oee7pJr5Do8lpMNcq9su9YzFL6HQgix+CCszg9Gc+Ykv3Q9E3cti4blUKDNwrrShevjSsCZZK/O9CcUk8llHgjUEEWyBHyW74V78a8plqzK6rJhbcX+Ckh9yp3Mflx03OJ88gnKAoJEGKGVIl2Kxa8NoHcTIpK8q4UX3dKgVJAqmQlyoy77ldlPJjaiR0qRPov6JgKkFgdac=
Content-Type: text/plain; charset="UTF-8"
Content-ID: <79877DADFB1C444381AF6785C57EE498@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: softube.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7717d78-40e0-4530-9d34-08d6d4bbcc43
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 20:20:36.9369
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8974e373-3f62-4142-9b7f-1b77262c89ea
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0201MB2188
X-Original-Sender: arvid@softube.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@Softube.onmicrosoft.com header.s=selector1-softube-com
 header.b=REDcRG1J;       spf=pass (google.com: domain of arvid@softube.com
 designates 40.107.13.90 as permitted sender) smtp.mailfrom=arvid@softube.com
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

Se below.

On 2019-05-09, 21:52, "jailhouse-dev@googlegroups.com on behalf of Hakk=C4=
=B1 Kurumahmut" <jailhouse-dev@googlegroups.com on behalf of hkurumahmut84@=
hotmail.com> wrote:

    In such cases, Jailhouse hypervisor console information is more importa=
nt to see root cause of the problem. If you do not get the console informat=
ion, you cannot get much help.=20
   =20
    Open Hypervisor console on new terminal may be ssh connection more suit=
able against Linux hang situations.=20
     =20
    --sudo jailhouse console -f=20
   =20
    If you have uart port, it is pretty. In FAQ.md file,=20
   =20
    on real hardware, you'll need a serial cable. Connect it to the COM por=
t on your motherboard. Many modern motherboards come with no COM ports, but=
 they usually have a header you can attach the socket to. Servers often hav=
e serial console available through IPMI.=20
   =20
    In hypervisor-configuration.md file,=20
   =20
    #define CONFIG_CRASH_CELL_ON_PANIC 1=20
   =20
    it is suitable for hang status. please add it to "cell-config.h". And r=
ebuild and reinstall jailhouse.=20
--=20

Thanks. I'll try that at some point. I already use serial out from the boar=
d using a RSR232-USB cable, so I should be able to do what you describe. Ho=
wever, my original problem, where the kernel doesn't load at all happens lo=
ng before any jailhouse module is loaded, so that won't help in this case. =
I guess I can try this when my machine hangs at "jailhouse enable", but to =
be honest, I didn't really expect that to work, as I wasn't able to reserve=
 the amount of memory which was expected for the config file. Maybe I can e=
dit the config-file (.c) and update the memory regions somehow to match my =
memory reservations, but I have a hard time understanding how that works.

Cheers,
Arvid



--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/E34A3AF5-43A8-4C94-BE2B-7A9A033B7D22%40softube.com.
For more options, visit https://groups.google.com/d/optout.
