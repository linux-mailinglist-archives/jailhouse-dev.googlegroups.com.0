Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBAOJS2OQMGQEHA4MGUA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAEE655099
	for <lists+jailhouse-dev@lfdr.de>; Fri, 23 Dec 2022 13:52:40 +0100 (CET)
Received: by mail-lj1-x23c.google.com with SMTP id bx14-20020a05651c198e00b0027b58179b0asf1133039ljb.5
        for <lists+jailhouse-dev@lfdr.de>; Fri, 23 Dec 2022 04:52:40 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1671799938; cv=pass;
        d=google.com; s=arc-20160816;
        b=d1W5BVf3pMz2CeER59BBMi2v6L4cZubSPuprbYxbTguaKqPJ5YZ1J/z1WAd9U6PMzt
         DUpyr50oddIEW0C1Ujq/GzjKEAxwYOOfqro8hkVUeUy0enQB+JplvMPJ7qQEPD99aCB2
         u0DkoaVTn52251mCFEcAxCnsHUGo/N/kkcCkwizO9uw4wvk2qr2RnU4iPuvWiE/2cYqs
         FiZx1sAA/Irs15wUGHsvrUEofT6ckY1rZxVC//e2yFDJfCTFtHWHhDiWCtQb2aTIX2LJ
         p4e2w5xXmiMRM1XBcRlPKdXiPs0H0SG2PdjgLN8QeTFYn0NafuM0u/7CJ5VXuDQx947u
         yBPA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=9Ec56xNrD4/3k64KkR/PV4TV5DJthcGHzXq4SE7heyg=;
        b=d+S5BgLyhmBXAIW9fblFYovwnhRnfZh6jbCnSQC2l3+PC2h+Q7TopU2ELIMZOTQ3e+
         mUNjlYRPqT7KMSz/E8uCu7y/sWWkkhFvOm1NsS63NIVp290ITyJzAS/dtFM8BH2qggHP
         38bFZxT+mBFXwvjKfTYRblly35UNe3kVYNt3LMbHoNTHXPLk8wEuxwoAHKfxgTAVETBy
         YR/GP03p0zfsCat5XKRwSE9EjmWwFSG8JMA6n6uNlpDE+a29AaxJ21kcg8e10td6O3+n
         rHEPwUsCgNbPdMv1kyAsemZVXkjcKd0PFXUHvRsfK/zhlPC2vLv/ucR5ZL+NemPLrpY6
         c2FA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=kLfgFKsh;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9Ec56xNrD4/3k64KkR/PV4TV5DJthcGHzXq4SE7heyg=;
        b=MwTEQlqkmgNXcz9YeVFeY6MaMmjF04yJ5ZtlvgW/2QyCBayUbqFPu5rTv8R/JuHaLx
         J4koWIdHUdO9uJs9dc5GY6qmlUPYLfKbLcrXUZMposGX2qUVNrSdHKHwAs8PAEQ63Um5
         dO7cLgPf/dNliNH2tYZTefpqwshqWq+5J2WbtedPdtDUOOrTzjQmGwHJauTYx6pRKVrp
         L8524lWQ82njv8NsWGZ91uodvGwoOOXIKx8ypES0rqMzBUHhZtCp5unW3WHQkjE2sD0k
         lNwoMlJiigGKbrKYnkrNzX/6KMX3k9Ox+UHJH3k3OSYq+AoxN5NPmjCq5A0FqjVclmal
         rUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Ec56xNrD4/3k64KkR/PV4TV5DJthcGHzXq4SE7heyg=;
        b=yVrpy1vDYmDkyCpwcvdSQvqY1/zUDYftWboCAIKSXJReeeECV8EPwmtbFFHwTDDet8
         CQDlYxdmgTAUJLWfMfa9sqNisAB9Qwap9p/5DRJ/hbI0F4QSyGwv72Ua7s08WC0SFUnE
         8e135mTGEkDZp6NtxL3v7eIqRz5L4X/2ns5I3IR76Q5LgaHQSe0SW2Yz8r0uJoPNwjvC
         u9m0He9IHFShCovNqaIWS06yNpH5goIbh1/YC0Y6KxFm2jMsYZuLchfmmtpxsmxqvdPd
         h4t0sU+DD4wsyWn23imi0Bc4HPrZRGA2iX2NsWfrZ1vqXXEOq2Auaj/G2vK4gGCowcpD
         NOuA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kpZVi5/GLwOLkeOxqRecuQEAJV1lvPPLZb1EbLV3ZpuDTvmgvbO
	hOarRnEcKw2SMw1EBflUv7k=
X-Google-Smtp-Source: AMrXdXtriHm9xACxNP7MfHo2QYI3L9cICUHwoYMTNlPkIlNhuASO5Fb/tHIh3TB+Y+0tvGjrNI2r6g==
X-Received: by 2002:a05:651c:8a:b0:279:f57f:e4f5 with SMTP id 10-20020a05651c008a00b00279f57fe4f5mr397972ljq.338.1671799938327;
        Fri, 23 Dec 2022 04:52:18 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1045:b0:277:fa1:cf3a with SMTP id
 x5-20020a05651c104500b002770fa1cf3als705257ljm.10.-pod-prod-gmail; Fri, 23
 Dec 2022 04:52:16 -0800 (PST)
X-Received: by 2002:a2e:8396:0:b0:27b:5596:1e4d with SMTP id x22-20020a2e8396000000b0027b55961e4dmr2340334ljg.34.1671799936328;
        Fri, 23 Dec 2022 04:52:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671799936; cv=none;
        d=google.com; s=arc-20160816;
        b=QUzbiRyP2ilQ4SzZzNRkoTFz/xSqXMtBNf0YIdCeO8VZzxUvO+dsSQ4tZgIvWuGWCF
         wXQYKGSYKAGB0Xo4RJ9t7YTfbkMqxnAkBwEw38WzCc2C7QFKyebsZdGvqyrk45pqp4Jw
         KoKAufQhrlNzjQ7G4MFNymxh6AcZyvdR+915/AEKjFVMENmHnAGCpyaSbrXd1Z8QKHJx
         8KvrE7DCOucN3kuIPUttnj/uH09jGexT8EftlWLJJALNWhpV6kyneF99Tul1jYSU5EMi
         CAwgrtOS98c+AYuXSCTlGNRmvOp7tSt6MLKiG88H5xpDVjZ2exBe3wCCUvl48mxRQIFB
         GQfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=a/j3+zCmZ+xvHVIvCGrfnJzn6a/iox81gtJ3HRSQxXs=;
        b=N9+PIEUaetTEO0MR2SUQ7qK/84V9MvpVY54pinRnO2u4uGQezTPSPIY/g6EF43MtQO
         IkVos6XcBlAsnEmevetPiTYrxugxCo0e0C5ubf12oCpcvbMLgnupewdeY8SFr7peBbb9
         Ksgg2f+/zACKaBjvP2d4orfvAWZjDj0hw+vZyvXOWRUmc0wAZ9Ns4QmVwtAJlhgj3fBl
         0apUHdY3dBf/vqq/F56gm4by3rhviK5DqpL298JtcZb2w4G/tRq+A+tRobRcQATPfSd6
         uDfPrnEkhOPLsY1Gj7V5sZIrCiz8xasRQF5zgIir2b1Msl8TJos0rzldi8yL6NSYFHYc
         roMQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=kLfgFKsh;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id w2-20020a05651234c200b004b49cc7bf6asi150508lfr.9.2022.12.23.04.52.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Dec 2022 04:52:16 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4NdnBl3L6Dzxrr;
	Fri, 23 Dec 2022 13:52:15 +0100 (CET)
Received: from [172.16.2.140] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Fri, 23 Dec
 2022 13:52:15 +0100
Message-ID: <3b9e80c5-3492-02fd-cfd9-ca16103a2e64@oth-regensburg.de>
Date: Fri, 23 Dec 2022 13:52:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: printk issue in hypervisor code (jailhouse-0.12)
To: =?UTF-8?B?5byg5a626ZOt?= <j.jyaming@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <c825f8ec-ace9-4f1d-a35d-e2f87a7ee29fn@googlegroups.com>
Content-Language: en-US
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <c825f8ec-ace9-4f1d-a35d-e2f87a7ee29fn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=kLfgFKsh;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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



On 19/12/2022 04:26, =E5=BC=A0=E5=AE=B6=E9=93=AD wrote:
> Hi,
>=20
> I'm confused by the debugging of the hypervisor code.
>=20
> In *int ivshmem_init(struct cell *cell, struct pci_device *device)*=20
> (jailhouse/hypervisor/ivshmem.c)
>=20
> Here's a *printk* code: /printk("Adding virtual PCI *device*=20
> %02x:%02x.%x to cell \ ..../
> /
> /
> When I have changed this code, for example, /printk("Adding virtual PCI=
=20
> *device(s)* %02x:%02x.%x to cell \ ..../
>=20
> After making and enabling, No changes are shown in the serial output.

You have to ensure to use your latest firmware binary. Update=20
/lib/firmware/jailhouse*.bin, for example by using 'make install'.

   Ralf

>=20
> Thanks,
> jiaming
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/c825f8ec-ace9-4f1d-a35d-e=
2f87a7ee29fn%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/c825f8ec-ace9-4f1d-a35d-e2f87a7ee29fn%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/3b9e80c5-3492-02fd-cfd9-ca16103a2e64%40oth-regensburg.de.
