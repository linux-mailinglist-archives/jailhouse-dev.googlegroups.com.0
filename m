Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBVU62XWQKGQEMCC4ETY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FC8E6189
	for <lists+jailhouse-dev@lfdr.de>; Sun, 27 Oct 2019 09:03:34 +0100 (CET)
Received: by mail-wr1-x43c.google.com with SMTP id t2sf966900wri.18
        for <lists+jailhouse-dev@lfdr.de>; Sun, 27 Oct 2019 01:03:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1572163414; cv=pass;
        d=google.com; s=arc-20160816;
        b=F+tq84zchI6EANq+iYzGaBKaDNlDIa27Z9Pakf41ij1nnafsnLLmukLaZHmfjeFRKZ
         ZW+bMcLIn3hnnLPw+Rqr7Jf9f2FKl/yuF3dqgA4ZvCBS3ExeBNJh/KFAAImCwcAUmmdU
         UGh62slfccTViwTyHOqvXXx7GSN7NOssjkRptCFJZg/x4N/BCX/axsy7VmhzyhS96Hh5
         7L/vl+qB6MfBB5PRXdMhZN7LIqPRndSCtEKoiT6VAdA8uB92lunpqi+GjAo64VvBfSXp
         uEg8fw6zUNEaEFpIzGDa3S/wDiLKa+FUtzTliV59s7FXzmg50gcmuqS8M9AxQyFuWukv
         d5FA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=i2YgUNScaoqhALnPZKPG6WZcQbW6kqke3w2J2S86jT4=;
        b=cY/gVzMZfhdkEbK7eZK0XGkx/zTnK95AGOdb/slxAofe9AgkneM8G9hN8MQmq8xbbC
         g5ACxDo/GAYQmXrlKAbf+aDl6PtKPrhAH64kjV9CqASxvIV1vhuXmqzth172QFyxnPAw
         +2/CDKLZxXB2hvhVc6GuQ6ylUgr5QzXc73rLGSUbxIJjComLcoUsTfF668khOlrXyqZ8
         qGef7VUfu9ho56VEaGl/Xqp66VEDwUnclxAc+yLmio11c8s/KFjsZLWRlOxwYLjdG/+e
         CaI8/RfkCymRjoIEoytkZCURCpXwVsaMAYjX17g/Jz2Qi9z4+N3AmYD3DW/CxTugCvbE
         FJTQ==
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
        bh=i2YgUNScaoqhALnPZKPG6WZcQbW6kqke3w2J2S86jT4=;
        b=eW+gfuhe3w98wDVmbhCrBJx3GZeFUHEUnRH2lNflMxJ6iCxFqFdrGj3KC8wKtCSA/+
         UBQ2dy9MN+37ZE+7CvC8yUjZ13eFe3CS6QRXMDXr5hH8TTw+azKczb3V0QTuOmHF7/Nq
         DD3PzIZWdfPEqnGqv1mGRzNmevfOU/rHEihynYktKgRp1DugJV7D8JKrYxKWN073b/zP
         I61bEtJ1uqKeNE6h89qv+f5wK7arWNyz1G6oYfYMEeqPrrhjUetamidXJ32A9JdP1xVr
         5GFk1nSsHoTZnCA8vj0Pl7iaM2LWEzRPeJ9SwxqcRJOScpWktowXl94NvKES1bqovbWA
         T+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=i2YgUNScaoqhALnPZKPG6WZcQbW6kqke3w2J2S86jT4=;
        b=J0uA9R/lFdBBUe0TAyar/7n5EPpgY5KrXgmbn6d7Ctes9OIexmkeaiZi4BtyVoXOQr
         QQ+lnfKzljJ5ZVJrDQ871zuBcYvIM+rj5yfEy6T0DpUgfJZ5/E10ABAg4ZMSEWiT3zz9
         cQOmxJ8bTbaX3j16eGlM1V0bu6CwI8Vqrt3/pnN5HIJuZbPbdSWxRoOVjUVx3pi5oqOD
         IZtuwZB2l+bX5iMnXcWC0DQqYLHtQiopENHfXwy4F6K8/kuAc85kmfgU1DK4DHw8Jw8s
         jxfoKoQnjXviCs3VQ+v1EXWHNRH1hnEKvuPTLfDvy3rTZ2L8WH9TgO/O3zVPrG5DBVhk
         X+0w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU/rweNN2DWRdtjA4BmdvHJjr70MiRlOd3X1jcILlf4nKcKG5XY
	8IsTL9ciKLEUbFi9gmG/5fs=
X-Google-Smtp-Source: APXvYqxmo+c2II0Xm7SimzfERET8xkdXYvjYFp9wyMC1lg2dRkqG1GmqPca8FGcbReD2pJCAgAV1ug==
X-Received: by 2002:a1c:f402:: with SMTP id z2mr4081283wma.161.1572163414565;
        Sun, 27 Oct 2019 01:03:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:c448:: with SMTP id a8ls9609008wrg.0.gmail; Sun, 27 Oct
 2019 01:03:33 -0700 (PDT)
X-Received: by 2002:adf:f004:: with SMTP id j4mr10938449wro.68.1572163413525;
        Sun, 27 Oct 2019 01:03:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572163413; cv=none;
        d=google.com; s=arc-20160816;
        b=ah/3WVMT7Rajlsf3kYPUxOQLcD2hd1ZKKlXbHFZCrRRQol/iSaAY64oTWoM5SOJPrd
         VZ9AQ7g7hSLuCGYN76knQovf5QPm/OuuS4Zbndjf6t9smWvAGmALjez0KOA+EQGQOp3R
         3TdSLFeUKdU/R0/gB36W5ndnen+6d1myXrdzC7Tm58QBl8B6yxpybC51RtfMIeAsvWpf
         Klc2j0E+kZDbjVLft+7TxKu6siB58L5WHOhYUGgHhI54z1MJ6YShj/v2LWWGnr4Yek3k
         INzOcnDbGO8QAyZa2PVPAHjtdZqQABPcc6meeC5GxP081aojjReg80/QCYzSbrDZ4iUA
         wwuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=15PfgLaCG4jVxUvGjhsYwCprAF2LNP/HVwX3wxf95qo=;
        b=kR6BDJc+qv515Z2tWy/Np45JYo+jl4P+jzNsY9hOa0mfh9EhVZeUqGmatzV12TUe6J
         a9LrBH/dSrmBnT3/ZSwbsqYlch2tzbUCPCcQfEEgKIEfnv28Bx4C+XmzDhkSF+Qnj9t/
         n7iz4p5YKOB1BYkb1XduySeSpbMV3KWtwnbs0Waiab6iznRpDIkf4HX29ChmLaf8gzPh
         lMdT4GLorvcJmFwQ3beTkEw1Tg9Xh77DAAyiItPKLHVdMVl+4E1Z0+w6eUY9WKMRjAv8
         qwCwklSWBHPV8982ULCun0rQpEwOfH/6zu9JkkWBDCbUIRqzBiIqTsoc0C7r+jv/k+Yy
         I1/Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id y188si408962wmc.0.2019.10.27.01.03.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 27 Oct 2019 01:03:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x9R83Wxe029652
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 27 Oct 2019 09:03:32 +0100
Received: from [139.22.33.136] ([139.22.33.136])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x9R83V9w016681;
	Sun, 27 Oct 2019 09:03:32 +0100
Subject: Re: GCC 8 + 9 not compiling cell configs correctly in Kubuntu 19.10
To: michael.g.hinton@gmail.com, Jailhouse <jailhouse-dev@googlegroups.com>
References: <f524bf21-7361-4cac-9766-789ed9c92ab2@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <5b73c7ca-5302-826e-9dfa-71610e31d8f3@siemens.com>
Date: Sun, 27 Oct 2019 09:03:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <f524bf21-7361-4cac-9766-789ed9c92ab2@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
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

On 26.10.19 11:13, michael.g.hinton@gmail.com wrote:
> Hello,
>=20
> =C2=A0
>=20
> After updating to Kubuntu 19.10 (kernel 5.3) from 19.04, I get the
> following error when trying to enable the root cell:
>=20
> =C2=A0
>=20
> JAILHOUSE_ENABLE: Invalid argument
>=20
> =C2=A0
>=20
> dmesgshows:
>=20
> =C2=A0
>=20
> [=C2=A0 475.080776] jailhouse: Not a system configuration
>=20
> =C2=A0
>=20
> which comes from this code in driver/main.c#jailhouse_cmd_enable():
>=20
> =C2=A0
>=20
> if (memcmp(config_header.signature, JAILHOUSE_SYSTEM_SIGNATURE,
>=20
> =C2=A0 sizeof(config_header.signature)) !=3D 0) {
>=20
> pr_err("jailhouse: Not a system configuration\n");
>=20
> return -EINVAL;
>=20
> }
>=20
> =C2=A0
>=20
> So the header signature is not correct. Looking at the root config file
> itself, this is what I see for the first 32 bytes (in hex):
>=20
> =C2=A0
>=20
> 0400 0000 1000 0000 0500 0000 474e 5500
>=20
> 0200 00c0 0400 0000 0300 0000 0000 0000
>=20
> =C2=A0
>=20
> Kubuntu 19.10 ships with GCC 9.2.1 as the default. I get the same output
> above when I specify make with gcc-8. However, if I run with gcc-7:
>=20
> =C2=A0
>=20
> make CC=3Dgcc-7
>=20
> =C2=A0
>=20
> The cell config compiles properly and I'm able to enable the root cell.
> Here is what the first 32 bytes look like:
>=20
> =C2=A0
>=20
> 4a48 5359 5354 0c00 0100 0000 0000 003a
>=20
> 0000 0000 0000 0000 0000 0000 0000 6000
>=20
> =C2=A0
>=20
> You can clearly see JHSYST.
>=20
> =C2=A0
>=20
> Clearly, GCC 8 and 9 are not compiling the cell configs correctly. Or
> maybe I have something weird in my development environment causing GCC
> to do this. At any rate, just wanted to bring this to your attention.
> Luckily, compiling with gcc-7 seems to be a good workaround.
>=20

I suspect something related to default settings of the kubuntu
compilers. I don't see that issue with ARM's gcc-8. Could you compare
the objdump of the corresponding .o files between gcc-7 and gcc-8?

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
jailhouse-dev/5b73c7ca-5302-826e-9dfa-71610e31d8f3%40siemens.com.
