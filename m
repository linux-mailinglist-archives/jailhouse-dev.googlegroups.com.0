Return-Path: <jailhouse-dev+bncBCH7JLGR2YPRBFWYR6HAMGQENP4UQQY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id B79EE47DE14
	for <lists+jailhouse-dev@lfdr.de>; Thu, 23 Dec 2021 04:25:11 +0100 (CET)
Received: by mail-lf1-x13f.google.com with SMTP id q13-20020a19f20d000000b0041fcb65b6c7sf1738247lfh.8
        for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Dec 2021 19:25:11 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1640229911; cv=pass;
        d=google.com; s=arc-20160816;
        b=YrjtioMamkZrPqaOkC+ORGXiFA7G8+iLX3kB4L+Zt36V0lcU5EaLG2aVZloeG4oSv4
         gdhClrCjYNSaPG18n2dG9GGbd4XhaCBvdjmdGPrq7rjc5cSpsqHCVwXxJKGaBJk0wkjV
         7pMr/Ir6a9Ay2psg4mF750/JOsXiQirn5hIlkO8Aw/TqbqGnz8i5iu418lngCj2XNrnB
         JN7HH6ff8LPup/nw4c11KoSey4PPDCfmxaGR3lVq7z3wnodRAspc7fltRfz6prVDjt9F
         iGhhOam0JLIqpBGnKczCyrl4eBiD4smT1oHjtKtEHrNh8QTsPEkW/Gi0iOGQxXJpBABR
         0q+A==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :suggested_attachment_session_id:content-language:accept-language
         :message-id:date:thread-index:thread-topic:subject:to:from:sender
         :dkim-signature;
        bh=HZ8+paP7I1tPbnqtnz+nDmyWs3nw0/d+ZKRogKh7DE4=;
        b=G7Y+m2oeHRA7dkkJqbvd1iplAQ+GeFHeR3eCVz8JrGKaZMK8eSbsamZSUJNGblsPd0
         /g6LNKSq7giUBOfzcGg39tPsVRSnAD+EpG2IWFk0DnXs+nLsGByH8eXWpgG7PKGgCNCM
         X26wEmyXpG6lbmaueMctRZpo3jvRC9QhbmQtNLj2TqMiPPN2IROiYcFpdY1RJid3pC2G
         8kwq+y73UGX7Jh5J7ULv+vwK8pLFRAQ96jEpFdvAHYmdzj8hvaBur+9is3Dp2ddG7r2p
         v/4TFpCuuiqQ6zhRk/KpCdd7RKNAryIEf4/5kGcmp3y/oI5WdCMCyKaP0MsFVmPC25sQ
         NrUw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@hotmail.com header.s=selector1 header.b=AjWPLj8P;
       arc=pass (i=1);
       spf=pass (google.com: domain of fredwz@hotmail.com designates 2a01:111:f403:7010::82c as permitted sender) smtp.mailfrom=fredwz@hotmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=hotmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:suggested_attachment_session_id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HZ8+paP7I1tPbnqtnz+nDmyWs3nw0/d+ZKRogKh7DE4=;
        b=Uwx7SNV09SYEuLMoEIdEBOHew4oozswlGcGMd2iN4mTi8+eCn9sOJZvVohUKopmKND
         BSM2nvh5o1mOwkprn8kg3DYyRobTuNIwnxL/w2QEJhnpsyNxbeYDemIpYOMzUfO0sSvD
         u1FZQ13mtpw8pbhYNPvWGN08sDJaR51y/gOsjB5QZjfIYChoSxoAiZMnjHziQeZyAGS/
         a7xkFAexy7Xqz48CduFShJzVLeZsUZJAwxqnv9jZ0j+i/gI+77FwK2ZmJOufPnycqJbi
         n7r5xyZ1QuVlD6AFOIEHlpDKg19jtq4wdBLsO5vmb9tBAb4sEEx1wmC4vD2eNKXGulDE
         RSAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:accept-language:content-language
         :suggested_attachment_session_id:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HZ8+paP7I1tPbnqtnz+nDmyWs3nw0/d+ZKRogKh7DE4=;
        b=j/EmfnnVJw9FVhbjmnbjYvaTkap7sKdxdLtmVHXUS1uzehm8t0WvEJU7wIWH496+Iu
         8eWtmYXtAtobY6H5o3/NhA2ejgEij6JO9p7ZkEWAszWBtt9CBF8ufBy0s9Fb6/echKDN
         EAzBSuAnQzQqNxmMA7C7i8K1Kj2vxSoilpKGPl5rWjw13AMJoQ4zx4ekSEDwo9sTY/yw
         a0+1EOkK7rKFbTNoGWuDFjoOH3r5Y4fbQ8gtPHFHg2YjnNy3LH9mSbCLGCBIQm91VpU1
         lGRXEisB73X7ICJFMLftUxwcw3Nzkc2AD3pgBKDypdWl7nAMEonBjDEbIWkZcHfwFF3E
         bQPw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533bXNNopnxEuZGCqEqxAfX82i4KuKHguI6DO1L568re/tI03eFD
	e9JVhIXngjmZEFP9YIeBSXY=
X-Google-Smtp-Source: ABdhPJyRAgTzbcza89zrLAWPYDZIZJpbC04zNGEhMHxuhHyGO3fAonmuGR9mW7x15X5m1clFfeEXQA==
X-Received: by 2002:a05:6512:545:: with SMTP id h5mr487625lfl.191.1640229911120;
        Wed, 22 Dec 2021 19:25:11 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:234c:: with SMTP id p12ls2532578lfu.0.gmail; Wed,
 22 Dec 2021 19:25:10 -0800 (PST)
X-Received: by 2002:a05:6512:2303:: with SMTP id o3mr504869lfu.362.1640229909955;
        Wed, 22 Dec 2021 19:25:09 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1640229909; cv=pass;
        d=google.com; s=arc-20160816;
        b=xfLLfTEv58beTAN9bKs/mqwpAt1fQ4FEko86Wy8ylY/lij8fg6acs4mxtuzS9uVRJ2
         N7J21RBPN8C5zUIXLWf3qoai+g5QsCJ2TaHdYYBnAKqj7yXccdsHg4Yl8Gm4YeMXmCIC
         gdNRqiECOhU4Yy+ctGlNNI5eNGEO+/3WyXra0KquPmgF0ZLl/KEA3fHRo99KmcNiOgdq
         Iim0aldU4XeAqkihf/UNECrxU1URNlufOwrAzT3oyJsQLuoxSD7EECQRy+h9zTb6epAD
         GcARJhomUGdJMFptrcchsBl67V+oVUFwPnJzmYxM370SKk0NqmoOGlY66pP09zOKWIiH
         Kihw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:suggested_attachment_session_id:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:dkim-signature;
        bh=9WgsrBcsOtHg8o7TwzLydTloOYRcz9zHxreCbeVC1O8=;
        b=blWmJN8jf6L50D+bqTnYkF/poPISzaeAdeNgxfYcoihcM7KDAd/pcOkIwe6G7vzGJ1
         oOb5W/eZ8q5BYsARHS0er+ZmFFq0RouX80knfHWpa5+NLOEh7kxa8R16pOS4+omwHWKc
         tjAsAWOzRwWd6wKneHirpFTb86detJEElKOsUNjurowfG+OiSK/JLaz82BRg1wQ29i0e
         vIFY308fuXWOVFI5VFbbBlNY2riGb/7wECo24qwxoAingJIaIhiilUME90En8UQp8Rs8
         Yi7V4S+etwyiOpBB+QpwSAMgGiQInPLACdwZgGDcafnSXmdw0UQvD4jEa9BEC10yyz5Y
         xetg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@hotmail.com header.s=selector1 header.b=AjWPLj8P;
       arc=pass (i=1);
       spf=pass (google.com: domain of fredwz@hotmail.com designates 2a01:111:f403:7010::82c as permitted sender) smtp.mailfrom=fredwz@hotmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=hotmail.com
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01olkn2082c.outbound.protection.outlook.com. [2a01:111:f403:7010::82c])
        by gmr-mx.google.com with ESMTPS id g42si205019lfv.2.2021.12.22.19.25.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Dec 2021 19:25:09 -0800 (PST)
Received-SPF: pass (google.com: domain of fredwz@hotmail.com designates 2a01:111:f403:7010::82c as permitted sender) client-ip=2a01:111:f403:7010::82c;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hWblu0m9AVKARtPwD3J525rnGiYBWychUDvHKpwOcP/7ZojKnB6v+Xeh7lI9TTskcaOoVGab7pD7Hecp07+kplqMhQGur2ZUW5SQmWH2D4PBOuqAob5JHwy5uL19eXUCBX2N5CwCJ60XKwl8hyxFMxNmZdDRX9FAQ8ea7n/M/wvQpIzXsJcofKN+l9cCdV6AU2SxDSPEGHz5mpRC9LRpbjbmU00QOYFl3MD7X290V89jbmKlE/81jGbVEvVXz2GoPsEqWeFoEJxIiy9OFgYu6Z1N2ry5p0TEkKI1paBa6ztlI3pnwSVlIGh5bHsv87m+SJqQ/bgf3rkx2LK8/ne86g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9WgsrBcsOtHg8o7TwzLydTloOYRcz9zHxreCbeVC1O8=;
 b=JlGzRXnqkbl5Rvq1z9qIwVukIvfgryAMNbohpiHbp+DobuoWJD72ySS9X951CmA995IFbP/8xpg72ZZBG6PgEFFpOfJqMrE5OHbweYC+OR045mhiU4ba+G+QnKlM+e1RJGJ2C5SRSmrRKDknlnrsRCc8XNN38zh9tFULHnHae1kuMk2EmBIZgAicEY4WORqcCRdB/cZwPghJRXT+jwYkxQ+Bj49UojWVoJcUsH3cJi+V+DNreVmZsHKplbaGTHJZzmUsMUqLJsM7ETtZ0vPuQGusxyR+UGRzJ6dhncIGvb678DRrKl+78d25i8kJt8l6XhDEYDNNJod82VkoNhxcog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from OS3PR01MB7828.jpnprd01.prod.outlook.com (2603:1096:604:161::11)
 by OSZPR01MB8545.jpnprd01.prod.outlook.com (2603:1096:604:18a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Thu, 23 Dec
 2021 03:25:06 +0000
Received: from OS3PR01MB7828.jpnprd01.prod.outlook.com
 ([fe80::d9ff:cac5:b36b:c70a]) by OS3PR01MB7828.jpnprd01.prod.outlook.com
 ([fe80::d9ff:cac5:b36b:c70a%9]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 03:25:06 +0000
From: Fred Wang <fredwz@hotmail.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: help about the GUI on non-root linux cell
Thread-Topic: help about the GUI on non-root linux cell
Thread-Index: AQHX96wfrFW+jFZPEUKn5StLKD9cuQ==
Date: Thu, 23 Dec 2021 03:25:06 +0000
Message-ID: <OS3PR01MB78280EB0F9EA05EA0D747D78D77E9@OS3PR01MB7828.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 27a1a1ed-3f8b-f45e-a8ae-4bd15a604913
x-tmn: [DekpDglLCaa2nlJQqGLXo3USLqphhGLo]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7411286c-54b8-4ccd-42fd-08d9c5c3d124
x-ms-traffictypediagnostic: OSZPR01MB8545:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HYBVchYEPSZnkjTYKQ+KnAqh6MTMMcxQXXPYpg+H/WcGALFdptL+9tPmN8I7zx7NkZnCcXIw6FNDNBMSWj5Z9jKI/2MAoEvFEND8g6BYfBokV1wA6UYCKG8gsFHU7gBzxHdJ4Z57ZHL3F23sxk80/0DZskaBfFI7HTxgIhoRURl5HaUxYivaTGYLysI8Lx27mUpqJG9/6htiwVDpsjCgn+sJvjincAAt6+ofRe/mUpx79+lhfKGaYxrwhUAuL8m7jcq4byEIoWpvpl4FJ6ZQ5qUzWKdpGAkUj1EV1lOIjKi1/BU4WCgIlfUo/5H+fK0B7IsdFJkKmZMXa5aLtvb7PBWrg73XPhn5BI8pMLQZYql5dF0OX/DBf4o50vU5sXsxd9hC1nqhXEJPiTTBpW9CKtNhOdt02w+kVYkDsEHatDHniXudR5p3fgbPbhOnL9RtU0U11hvzHbTBUTKS2s+BiFGjQH30AAo6ywRIxI9VCGjHepnA9bsuLFG8BZaOYldVXJDjcenICU8YnpQVLLWL9YEjjm62fSJfl7e06hjx16vUWoBCDGDSDGZRPVKLPrOR1EW8sJqeoWKbFmnNNcGxlg==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: KENyr3yNw32pWGzxr0MhOSAsImUYJr2Y1d8hxHhwk0WjKR9l/NPPgNoN2lIU1Cqcs2gGDcdd1XMbYrpajwVjDCyrOuRGrP0nQuc36iSi8zZ6DczG0A3n8JJ+WDMxRA5i4P1DJXJ+qopAMuAWA55nCbXd8gNIcfZAR2lOHlzeA6eBKrICwz6av32Y2qyCCeDnMmrTTjb7C5Pcdd98V5dzb93KUBvRyEgL6Pw13fpp17bGSowtIRWaTIEmvI4CGtMRuprVO9ZDYVpUGwcBsgQBY/1sdarV4apGbJ0nq+e7nlx0ku5RZibCDsp/RoOYzDm33Vu/LRFNswWzO4WH1t3QocOfkjlvXQ8gYYUrMLMfc3Grfkr97yikY7vwjtiV/6as5gHh1qtEuKZpU0MmKphz+AIKc7WCfzUbzXaN9FNLAxaK3jZXZm6ilOuurCCPASa65HaOnNnkPQRaP5WfsxfO4JJVchGL2BGajwXyH7/I12R1EzzKPNFFb1JqWmJ1g7wF/DJSvmhQw3zrq+H6Jy97s0Fvh0WaVp2dLCUsDJycS94uC0wIUXfxMr6qLee4jkgtfnRMMN9Agyq8Kg9dBjJIsLO2xxDxEnH/1eIpabAO/aQhJjNu0KdBtjDbHVWUJ6mnmpbcKw5ZEm9U4oWzc3VK/moB3O9gz0SHfsVN3kxjerKe+qmkxLyLdqlIup7AXYPGupf4H/NCS9WnIPYNr+MCK+yxhkdbgkm/cK9Hs0u29RaHG4PE34lqiLLf8LMA744hJfFJsFXTCTLrPcC4CXxa9mT6qZ2SQ6Gu1imlAnDPgcURkKlXlplevz2SHQ1Ah1u1Kij5kCMIennwNWbSwGMcW/fTFlVpMC2kgqkVF0qJhEKjCUGJ+BJclXCXqg7XbafchQLPnM4FiZFd0K2ZCMFQH8XGhjV2CZxauoQOIDFNoQ5Npi9UlLmjfrZNUemYnj+V
Content-Type: multipart/alternative;
	boundary="_000_OS3PR01MB78280EB0F9EA05EA0D747D78D77E9OS3PR01MB7828jpnp_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-9cf38.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB7828.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7411286c-54b8-4ccd-42fd-08d9c5c3d124
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2021 03:25:06.5554
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8545
X-Original-Sender: fredwz@hotmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@hotmail.com header.s=selector1 header.b=AjWPLj8P;       arc=pass
 (i=1);       spf=pass (google.com: domain of fredwz@hotmail.com designates
 2a01:111:f403:7010::82c as permitted sender) smtp.mailfrom=fredwz@hotmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=hotmail.com
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

--_000_OS3PR01MB78280EB0F9EA05EA0D747D78D77E9OS3PR01MB7828jpnp_
Content-Type: text/plain; charset="UTF-8"

Hi,

How to add Graphic user interface in the Linux non-root cell?  I mean Is it possible to add GUI interface on Linux cell to facilitate some operation. Can GUI apps be run in the non-root Linux cell?

The setup used is the image produced by jailhouse-image for Raspberry pi 4b. I can only access the root cell via UART and ssh to the no-root Linux cell.

Thanks,
Fred

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/OS3PR01MB78280EB0F9EA05EA0D747D78D77E9%40OS3PR01MB7828.jpnprd01.prod.outlook.com.

--_000_OS3PR01MB78280EB0F9EA05EA0D747D78D77E9OS3PR01MB7828jpnp_
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Hi,</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
How to add Graphic user interface in the Linux non-root cell? &nbsp;I mean =
Is it possible to add GUI interface on Linux cell to facilitate some operat=
ion. Can GUI apps be run in the non-root Linux cell?&nbsp;
<div><br>
</div>
<div>The setup used is the image produced by jailhouse-image for Raspberry =
pi 4b. I can only access the root cell via UART and ssh to the no-root Linu=
x cell.</div>
<div>&nbsp;</div>
<div>Thanks,</div>
<span>Fred</span><br>
</div>
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
om/d/msgid/jailhouse-dev/OS3PR01MB78280EB0F9EA05EA0D747D78D77E9%40OS3PR01MB=
7828.jpnprd01.prod.outlook.com?utm_medium=3Demail&utm_source=3Dfooter">http=
s://groups.google.com/d/msgid/jailhouse-dev/OS3PR01MB78280EB0F9EA05EA0D747D=
78D77E9%40OS3PR01MB7828.jpnprd01.prod.outlook.com</a>.<br />

--_000_OS3PR01MB78280EB0F9EA05EA0D747D78D77E9OS3PR01MB7828jpnp_--
