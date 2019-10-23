Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBTWRYDWQKGQEFVRH3ZA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x637.google.com (mail-pl1-x637.google.com [IPv6:2607:f8b0:4864:20::637])
	by mail.lfdr.de (Postfix) with ESMTPS id 3849DE17AE
	for <lists+jailhouse-dev@lfdr.de>; Wed, 23 Oct 2019 12:17:52 +0200 (CEST)
Received: by mail-pl1-x637.google.com with SMTP id c21sf9393239plz.9
        for <lists+jailhouse-dev@lfdr.de>; Wed, 23 Oct 2019 03:17:52 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1571825870; cv=pass;
        d=google.com; s=arc-20160816;
        b=GhkkhyAY+Vr6eGgyb3KYGqv+NmD6u7FDTWwIjb693HwcyOCMePOuqyRwbWvB+KSbxb
         N3cBAR94zbDkmo+K2+AvAtyZCmr7vQP/8G1R9ShenruZn+7I0fFnmbVQlPiWw7BZxGJD
         0Lk1UBeWQJrIyFaVS/+eW99QDj59Lie5iaOT2cOP03vKqrCQSYaR2rxMxX45xD1+GDte
         Eruc8tUqxgtULTyfV3/oixmTUUbtJuNx9W/RcbTN0xzC5xxLf6qiEHWgJLE2tEtPeanp
         Wo3ZBRtXeJIyHuIzBPWryoGWtq28bBiNwb8RHk3RmoLGlhOLrUD7xeTkjs0CKVIC19dD
         i7zg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:sender:dkim-signature;
        bh=HtEZ3bxfNH4YoMbGP69GxNV/XJFvuDpgOg8YgmBMWmA=;
        b=iK0doa7kOb75b2MnCd2Ic/fg113upVhe8Z/vsyosDtAXRt1F4Frd/TkMERvpnHX8uE
         WrdjpUYJNaeDvclXy0AJfH3dXFMgHW8wUVRGlKkXT7iZbK/q46pLhK6BZmsg5+I3mFbn
         E/30hKZJLKmlf7EOFQs1im6pJKQ680iRflmzgxKnOw/3aKitg+aOECdcGAPDYmEcYBTR
         X000SrTIbwvOMsp6FGpcwvf1yDKn0aPfDeTXL087GXqL4cMitYJfajM9fe5odZkHe1Qs
         R4jB34ZobZ27SRr8mynWbY10u9FufksmURXU8ZJ7NXKnEkzZ0UiUu19RgaNdtgjWV48v
         DX8w==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=pdfqVwh3;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.5.68 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=HtEZ3bxfNH4YoMbGP69GxNV/XJFvuDpgOg8YgmBMWmA=;
        b=KmW9DyGRqIqBV3Pwa+j0VFXSCWpz7AV2/jc4owHJOuhdCEwroXkX+fYKbsHLN1lm29
         Fm4iU8/4mj4TVEv2q0M7TxOj0NgrPDfv6xBvhDpt0yV1E0/V4WZTGdyZD4Qyi9CyGLDg
         2Wrv/Cmc1Z/IXBHvJdWI8fn6R+P5rW0tcderrupq/GMZ2uLZKlMAGydhVWjZ1XJWU0EC
         xfb0LwIG/dZH3DLeZCHR3T4WDTuROW3SfNPhEP+b5PfEJLc7h+Mzhh2LB2o4u23R3LQR
         MDpYjOt1K3fWbtijcePmcCVa9UZa8TWpAIs/TSvNU534gl9OBfvlHRczJHFfIkSU2U84
         P7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=HtEZ3bxfNH4YoMbGP69GxNV/XJFvuDpgOg8YgmBMWmA=;
        b=Jir6u0zzUATdeh9V2dkN2SlAN2EyN70k0dgkr8h2RUf8VSVY8q61tFOvfArZyUAhxx
         qxokGaXC28ShfCaeSAwRcmTjeuf19He9eKfbH6/gjLtSzxi1YNFmzJSw8Emr561yiEbR
         wK4ks3ajDv6nL1aPmyqhxrqy9fQSkIfAXzFwUD9WpARGeGFULwN1N9oB58f4VVzbjDhQ
         ufA+/fZD6jVdE4yMSJq4YmIGG3ne2mLZOkFvXXGwfiMvobnyHHfSKmq6uFvf0A0jIIOA
         mo3BqG4WVWHcnnrEeYda2l6xHCPbbbHtT3VTqRojApW3hA1FIV/UWdf3WdLWwgD/A/KJ
         Yf1A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU9FtDteaOcWEXAngHNhC8VS6WpjyHW2pWvzSYEmTn3KqJvFQF+
	Bfb6VbylUdf8jhQY6o/MYZQ=
X-Google-Smtp-Source: APXvYqwtoQfsLAtuT69NELbgAWaNbcU25cXAboyWlfPoJiIpUM0GrNb8931jREJzR9X5Aog2eaX/rg==
X-Received: by 2002:a17:90a:244a:: with SMTP id h68mr2803773pje.79.1571825870686;
        Wed, 23 Oct 2019 03:17:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:25e2:: with SMTP id k89ls682901pje.3.gmail; Wed, 23
 Oct 2019 03:17:49 -0700 (PDT)
X-Received: by 2002:a17:902:126:: with SMTP id 35mr8861483plb.327.1571825869873;
        Wed, 23 Oct 2019 03:17:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571825869; cv=pass;
        d=google.com; s=arc-20160816;
        b=gl9Rhjbrr/yLgpUoHbNP9vc3796Ub4Hcg340mh7Yfg6HYC/ouGx2HQDH9vwDK970Yq
         pve4qH3/hm3VAoaiZPQmMyhy5hztpr0G77A1+nDhPkrb7laQpcEof4R3olpGaw0/VzCb
         Pe5z07BQ48R/DtH19naPzziuogFjzCLnbL1ugUBrUoavd1yOq5D7YubQ/XjtX+Sfxv65
         LgyoEk+tbZNl47dW1A9kKz3KyvMva/584d2r4u1YiHCFiVivDw2q7E7p6pSUgdHvdIta
         KMTqFd1alD0uX3oNPiNeQw7iJz+Z1Qt7nqbBiBORlVbWYivB8DWiD16obXt+bvByWrbQ
         bN1w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:dkim-signature;
        bh=gnudtZHjHpjOaFJWqDDO6gSM0HC5UaptF4zhvPB3DKo=;
        b=mEl9GBEGotyIVTVd+E3MKUjccazQTJ4DURyZHaXmsAXkFYPFI4no0Pgbq8din8OMRm
         +J969sckzpyx/0t3gHAGVdEIbVuDzzdO1Ga1xzLNie4oafAg5X6f9YhSjUnWjVc8wS7i
         soawbB3vB4mxN+DxoETg+oY7noPIqxOKzyCfhxAbPQLQDaX9CXE3SbcTkXA7XMdckM50
         KG92qyNFfLMpEk0pzw+DSktbg3eAEMI3byJLZQQA/LQnwnzI/DT5XuH+cm7kbhdU3iAx
         WW9v0rVXEQCByQKuADsngg983LUUKQkxLW3w3pRtfKN0MXAaoQ+QGiGWsargAzhmZhwP
         etmw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=pdfqVwh3;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.5.68 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50068.outbound.protection.outlook.com. [40.107.5.68])
        by gmr-mx.google.com with ESMTPS id h13si465430plr.2.2019.10.23.03.17.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Oct 2019 03:17:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.5.68 as permitted sender) client-ip=40.107.5.68;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BIvYuQLBwJscyfXifOk5LxkuNnaXYwviXelO93XjKb48tRIGXJe2SQIzsFBOtE/DbUQ22SnsbW+XK/BsJBphEAoIKcqXujU0bSgocqpOjIXErqi3tXHFjzv+whuMiG3IYx7guAjacepSEfqB/sZgGpsKMMRm5sZy3LsR49Pm3vPOkWt9g/L6knQAeTLFxM59JKZ7tVlim/z0ssJALVKj1f7aCSq/IUI0yK3jXGnT50f8RJ/8WDk+qnv8hsp8zHDsnpkW3afPNWIwH8H3JsUnHLNopD2oUIHv1k9v+03NnfaSj8g3uagB0BNVtMruVpPe9RpPNFr1WIBMaQPf5mj6Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnudtZHjHpjOaFJWqDDO6gSM0HC5UaptF4zhvPB3DKo=;
 b=JT7vZ+mKs9bvXjXEShSy/zkjw9h6X7OF9Ez8cCqrUI1rqA9UuY6RhRNT4/PkKqE+IJp2AS4R+FMg/uJToTdeTvEo+7DY2fBaN7IuUGfpi9tDl8zUJZWjx66MLAcc6/iWVOXFX7wKFm+npuvempq4MTk38I1uyxvok/f1fh9NIQi6dlrZAMN8WNjUCC3M8Uxn9c8rjTgXP2VKfXQ9cHX6XF2wS1FAMv3Q3t1Vuz9ft4kz3mCc+Tn7UL+gXcm4W4W2druN7YQlf1/bPp0iLAG4skqJpSfIpoI3diiGfhfE2bxRdbJ9goGUkGrgmqunrgBYhmfpEekasKc7DARMHmcqrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB4499.eurprd04.prod.outlook.com (52.135.151.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Wed, 23 Oct 2019 10:17:47 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::843c:e722:27cb:74e1]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::843c:e722:27cb:74e1%5]) with mapi id 15.20.2347.030; Wed, 23 Oct 2019
 10:17:47 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
CC: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: kernel build failure
Thread-Topic: kernel build failure
Thread-Index: AdWJivdyV76vPMKCSSqxB97kzzidxg==
Date: Wed, 23 Oct 2019 10:17:47 +0000
Message-ID: <AM0PR04MB4481A5E90644042A0E72DBB8886B0@AM0PR04MB4481.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 68aee567-074d-47d4-95a4-08d757a24057
x-ms-traffictypediagnostic: AM0PR04MB4499:
x-microsoft-antispam-prvs: <AM0PR04MB44991B775B7DAC00ED3C5983886B0@AM0PR04MB4499.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 019919A9E4
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(199004)(189003)(2906002)(5660300002)(44832011)(99286004)(486006)(6506007)(26005)(7696005)(74316002)(6436002)(55016002)(102836004)(3480700005)(7736002)(476003)(186003)(52536014)(6116002)(3846002)(6916009)(81166006)(66066001)(81156014)(8676002)(71190400001)(478600001)(25786009)(66556008)(71200400001)(305945005)(66446008)(66946007)(64756008)(76116006)(66476007)(8936002)(4326008)(14454004)(9686003)(86362001)(14444005)(256004)(7116003)(316002)(33656002)(133083001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4499;H:AM0PR04MB4481.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YFLS5Yw0Lyz7Mv64oMw36QaEuB2kHnE+t0YPt3jiGQdQM0DUWwHNI4/16KxFfDK5vTTORp36KezHY3rhzyFfw8MH/Uw23bDXT9rbG9expiHQIOqLk6yWgxd3ejQXdub87JAfcPuoS8U4XS+EadGNHSBK9vXw5Rf0VyonFJk1vnUIeRefa76bsBxLLsncguObb+EP/MwRrfYN5LzYyHJ4ARJ4L5rkH+gnuKu9ibnobnunBzBoQVh8hmol6jZ17McSvpEj4WNSUBRj3pl+SBRh6FdmeCjEdTJOA08G+AFQn/Te64aI+QyfxmbjfevBeAzmuKeQqItCEEXQaEy3V+i+nB7LCIaQCQTF2aRkw/xEjvhv+tMYkkaJAaIyAs5ywqzt1/8eMRCnSdUNNav+AUaBJx48qhoUYckRhQ7j5AYbSgEJwU6w0hrsLEAkez4sqxEm
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68aee567-074d-47d4-95a4-08d757a24057
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2019 10:17:47.0905
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +QlpcDHZWmVA72X0jeOIVIy0mHrnVTH+/s/PzqNMd84eiBIlmDx3T53CuzxCgxFRXfVJ9z/TMhSLE+LnHNzl2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4499
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=pdfqVwh3;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.5.68 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

Hi Jan,

When MODVERSIONS and ASM_MODVERSIONS defined, your queue/jailhouse tree will have build failure for ARM64.

MODPOST vmlinux.o
WARNING: EXPORT symbol "__hyp_stub_vectors" [vmlinux] version generation failed, symbol will not be versioned.
  MODINFO modules.builtin.modinfo
  LD      .tmp_vmlinux1
aarch64-poky-linux-ld: arch/arm64/kernel/hyp-stub.o: relocation R_AARCH64_ABS32 against `__crc___hyp_stub_vectors' can not be used when making a shared object
make: *** [Makefile:1074: vmlinux] Error 1

I did a hack, and it could build pass. ptrace.h is not a good place, but kvm_asm.h not work.

diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
index fbebb411ae20..3d4dcf691135 100644
--- a/arch/arm64/include/asm/ptrace.h
+++ b/arch/arm64/include/asm/ptrace.h
@@ -234,6 +234,8 @@ extern int regs_query_register_offset(const char *name);
 extern unsigned long regs_get_kernel_stack_nth(struct pt_regs *regs,
                                               unsigned int n);

+extern char __hyp_stub_vectors[];
+
 /**
  * regs_get_register() - get register value from its offset
  * @regs:      pt_regs from which register value is gotten

Regards,
Peng.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AM0PR04MB4481A5E90644042A0E72DBB8886B0%40AM0PR04MB4481.eurprd04.prod.outlook.com.
