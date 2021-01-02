Return-Path: <jailhouse-dev+bncBC4Z5VNBSYJBB7EZYD7QKGQELN4XUAA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C7B2E8689
	for <lists+jailhouse-dev@lfdr.de>; Sat,  2 Jan 2021 07:04:44 +0100 (CET)
Received: by mail-wr1-x438.google.com with SMTP id q2sf11036432wrp.4
        for <lists+jailhouse-dev@lfdr.de>; Fri, 01 Jan 2021 22:04:44 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1609567484; cv=pass;
        d=google.com; s=arc-20160816;
        b=aRvm6CDuK0ypvmw1a4W3Cdh2yVTCyLyLzGks91eJU4FkAduGlfThplaCLzCMcV2zPs
         YkWX2lVOFe32Qa9yuw6KADJpy0UlCfrwmsOIDlwslUBbMJ8ZPHu9HCPbAcuY+EZ7tnl0
         HHRTdLS/y8usGNLjGdl6zthvyIjWpjJptsKmDULelpPY/6PQuVYOQ5fni+fxlvmwcNeD
         CuiMPT7bqz+o/8zYAUIAPKF2rtrGlyK7r8o0ldfxaeqDFx6LBo4yEgy37d/UxrRh5Fes
         fYzwP13oQAyNVjWZdAbVQpFREkOzqkEOhF/AOcczyOBrCEsfy/1rl9mO+Pg8zTBmZDQ4
         u9DA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :reply-to:mime-version:sender:dkim-signature:dkim-signature;
        bh=nz+G4tKbrts55/EhQF+MstNlwfYfdjWt3hS5iQef1LE=;
        b=yFcqEgMIyylae+WFmoidkb9HEZBiD67bZl40tGCheqGBagQckw13DRZ9qcxgmpJvr+
         8lWwSRNwO2MBa1Br9rAmcg/UkkcNB7w21uQE0Xa1BH+RAVGjtFuk+5iUbvsNbRrEUnNy
         4v+RGl0jk2jvni76Q5ZIGSehqaoyCm0FS2hLObiCmrYHp863EgoTC7/53Xl3NaswOJ6k
         GDLXPTxl8ys1nvXGHIw5U4n30FfrnkOYRjIY5trgRvrdvFpKFW0Z94mY4pIF2SLPB4i6
         o/R1We+Lo2CNKniI9sToZ8xFNmjyLgzM7IFAwTsv0Z6bdHTd6KwWGLrr3RjE7+wSYodR
         vFiQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=AwvEUT04;
       spf=pass (google.com: domain of kath.rafael2030@gmail.com designates 2a00:1450:4864:20::130 as permitted sender) smtp.mailfrom=kath.rafael2030@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:reply-to:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nz+G4tKbrts55/EhQF+MstNlwfYfdjWt3hS5iQef1LE=;
        b=O/tvqHucguZf5wRQgsRfDmgp1gqxvsCUzAVXnn+Yu3KZ62K9vzfUf8WicxqjHLG0zG
         Al+PIyctEb965gmmtQahUIMfFNBgP+l59Ry0WLApaD4IufP4cbM32l51qXF8xVxdH0pE
         c2KjrshsP0y2xE2gDsj4+zXiJB+ScVuyg8/5iWiJFLRt/xtdxG157KlsqgIWjFa6z24p
         S35BfXt9YZIUiyXZ4A9doUn8ao1Gw0Ekp/4ESYRr1ZFd3PQBNy7y/49r+sZ9HOuVu9Cu
         HCqbYa1yjse6QL0BQn8PqYHRExbWfQhAUcsjHoiF2qtZ19GMvLZO5XiKNUTBkRvNhEXQ
         90IQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nz+G4tKbrts55/EhQF+MstNlwfYfdjWt3hS5iQef1LE=;
        b=IHx9S9IBaBd76iRJau5p96ouQNEqdytyHLLdsniRzm9iUXqUtE41EAncG1Zsr7QLFl
         mk8azqVyr2278xNU8y5x0LQsXUbHuCssoGzw+5/DGu0hFp1gipeW6Zm3WLjcqyosOR+V
         l0B9TUAMgNxFa2dGf9ApWe5zdPug8ThPxOLp/lalQvvyKJm3P+5PqyvAhVAiyu5CaFsc
         KM17gjcRWGIOa/t8g4ezN5Vn7KIIAFEpKzAcVUWzYrZqbN0vh/UVKBgUYaktQg++DIe6
         T5lzGO4oAqJacB3jQ+exIwJ98ZY4dvt8Vm6jBxL89nRh9PQXZbsu5GM36h1tQXVi2GJV
         +9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:reply-to:from:date
         :message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nz+G4tKbrts55/EhQF+MstNlwfYfdjWt3hS5iQef1LE=;
        b=CGXAFedtNAib/+CfXjKx0bHb6J/v3P11NrCcKEk1Q1fynU/lsE2zchxpSYheTzjTiw
         iYf+qKk+x/grT6OU+adNOQ2M+RUPpgxm1EjbHlpwGnfrgZZvbNFmPT9c4sCGBVaOTSOS
         UaYOfCxdxgHjaSjeBaYFjR914jxJRn0AUrnRY+WSww0mv+tHjN1uTmeLzgRy9xwPE3TV
         iSXqaH9YMvaUGxkqPBh1PObEWObIzwq9E4CNruzdBKjtrI0sRybkiZizWU6tmN79JP2p
         Pl8hL5tIDWCbg+vTBlPCS88d4onhu8DsSpwPdv1ivuNJKbHJVtn01vNnjxpJt4MdUFs5
         Cc7A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532+uzAwDeg733aaPjdOvFj8Y2QaN8HawSqVcfqy6C8CZAv7Nd7x
	4C/pZ+59i03Gjea4JGf83d4=
X-Google-Smtp-Source: ABdhPJwOqmSuE80F0ES6Y7Uehg0/WAnahNZNr4P0sikHSAecxIWnNe1rADZ3Wyhz9rmbcncskicDaw==
X-Received: by 2002:a1c:46c5:: with SMTP id t188mr18172569wma.3.1609567484536;
        Fri, 01 Jan 2021 22:04:44 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:a781:: with SMTP id q123ls5812986wme.1.canary-gmail;
 Fri, 01 Jan 2021 22:04:43 -0800 (PST)
X-Received: by 2002:a05:600c:224b:: with SMTP id a11mr18051672wmm.97.1609567483280;
        Fri, 01 Jan 2021 22:04:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609567483; cv=none;
        d=google.com; s=arc-20160816;
        b=uEQV2zqt+qSSrlxshvKmRhkQr73ee6CiLLp2vSZSbuA7af68cWB/rAPvbjHPiXXIQj
         sqzCX8EOVwaFIDHBtaebW+1vS0tRvwnhY4Ju+6frW1zRCGAHcaXezJg2KIWyrAK3Bd/L
         HCi7+ac98frRi4ppOy9kLa3qHR7ofQbXaNe22bGgNlkdat80GezDU29xUAkKDrLcC3lS
         IMj3Z0CuR4Ss3Q9vL3verQTJRG3OQ0I9O6eC/adiYxVyw4tFJwHlZvAnUhYk+9cQCwx0
         qpYjE+VSwbDaBw2oFcfpcLdH5z5L1wCvFeF85F7QI8p23N3LL92UmeEP0Iznk2bv6uVV
         YAaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :dkim-signature;
        bh=07wP4+HPBVC2VHbUnFYsgWGMeRKZwcznPDaqHki/QJQ=;
        b=mXlPingIOxTpj5wuQ3Vqo4lWZ8KT06DDqeZgKt6Uz7+Ojwu0PPtolD2EFShOD7l4Tc
         WZF9TqblxyiRhwdbLAqIsKM7/FpWGWLVkAMxdHqSqTSxxuoo5/bpPihh6UGWUubl3Y2u
         7W4WZf8EyTFch1P7YTF3Z5sIHLmUnWSw4G9K0KtQIa0SqqgGI+8YNdtwLqzDCNrPCCBO
         i2GVZKdH8zmofLlLZjv+8alcvOevmKVl+sEqll9evcVoIjmAqDnPxwDWjhrCpE5jKpB9
         ww8k2OveqfdZJboq2Mpt7IUxSUmUP+5m7WUuIwl0FVaOZXx+F6tuErUdA9H24EDqCT8F
         XHiQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=AwvEUT04;
       spf=pass (google.com: domain of kath.rafael2030@gmail.com designates 2a00:1450:4864:20::130 as permitted sender) smtp.mailfrom=kath.rafael2030@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com. [2a00:1450:4864:20::130])
        by gmr-mx.google.com with ESMTPS id n8si1718144wrr.0.2021.01.01.22.04.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jan 2021 22:04:43 -0800 (PST)
Received-SPF: pass (google.com: domain of kath.rafael2030@gmail.com designates 2a00:1450:4864:20::130 as permitted sender) client-ip=2a00:1450:4864:20::130;
Received: by mail-lf1-x130.google.com with SMTP id o17so52008723lfg.4
        for <jailhouse-dev@googlegroups.com>; Fri, 01 Jan 2021 22:04:43 -0800 (PST)
X-Received: by 2002:a2e:9246:: with SMTP id v6mr7657089ljg.221.1609567482716;
 Fri, 01 Jan 2021 22:04:42 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a19:6550:0:0:0:0:0 with HTTP; Fri, 1 Jan 2021 22:04:41 -0800 (PST)
Reply-To: grace.graceobia@gmail.com
From: Grace Obia <kath.rafael2030@gmail.com>
Date: Sat, 2 Jan 2021 06:04:41 +0000
Message-ID: <CADP0Tkc4zsTvGOR87UFbCtG0=7=DQyM=JTEBeeB9BzCQrL_XXA@mail.gmail.com>
Subject: Dearest in Mind,
To: undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: kath.rafael2030@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=AwvEUT04;       spf=pass
 (google.com: domain of kath.rafael2030@gmail.com designates
 2a00:1450:4864:20::130 as permitted sender) smtp.mailfrom=kath.rafael2030@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

-- 

Dearest in Mind,

My name is Mrs. Katherine Rafael, a business woman an Ivorian Citizen
and born in 1961. I have a mission for you worth $3 500, 000,00 (Three
Million Five Hundred Thousand United State Dollars) which I intend
using for CHARITY.

I am a breast cancer woman and have told by doctor that I will die in
no distance future, now and want to donate this money for charity
through you by transferring this money to your account, to enable
people in your area benefit from it.

Could you be the one I will use in this noble transaction before I
will go for my surgery?


Mrs.Katherine Rafael

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CADP0Tkc4zsTvGOR87UFbCtG0%3D7%3DDQyM%3DJTEBeeB9BzCQrL_XXA%40mail.gmail.com.
