Return-Path: <jailhouse-dev+bncBDRKPIXWWIFBBBWH42BAMGQEOQMZXEY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E54345965
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 09:15:03 +0100 (CET)
Received: by mail-lf1-x13b.google.com with SMTP id q17sf283656lfd.19
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 01:15:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616487302; cv=pass;
        d=google.com; s=arc-20160816;
        b=dMX86X+5up/QIrnrzMHHentOGdtiJhP52U/J/lBeK+9pxyy8qfnGY+ys/8GHytJ/sX
         yrBvaSNMYZG+yLs7Qy7K27w+dhCdFGV26OLnZ+3UdV2d66DnaIoMpO868KHcFqSV5rXZ
         ilP3+I52E29rajCLfYa+1t7z1jgSsQtGMNpGeIXYB7hNT5rHISWThanUMI4IkOqtCexH
         um09Z85rz4HYnkidHd+6eYdTfbmaLhsGx2dFfDWs/lkpY7DJ3BsX1xc0b6vjsCtzBqsH
         SteSEu6m2c17bFh8/7FEWFanrf+GKrppireVVZ1WlSZVCJrmdzgCUGuqoBYpvM1avSPr
         uQmw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:references:message-id
         :content-transfer-encoding:cc:date:in-reply-to:from:subject
         :mime-version:sender:dkim-signature;
        bh=fARVHRWyf2laCT2lwtbeVZU+L8GMCvB3vqILx1t6ZGU=;
        b=oftoAJgA7xMQ3045HecP9J9iPkYkF4sroCTrLUAOZCsjlbHXVUrBHI/O1BaftHIOCm
         urml6pKXpUpg5gK1WupEbeenlxnPtHZTBBIvjXLeUpwdMcw8tyLMiZRGrWKTF8pEJ4ng
         u/lItj0egxFD5+h8thyDaSmBv4D/nOd6QKhp1PY0ux3P9Y0/fElfqpd/knyutTQiAdwn
         2FNAJ36Y8tBW5ClIBCn8QEx0hzUgm8p2omCPUlDRO9zQ1j3nR/i4KQsyqbMh7mX7C9s2
         3umIf9m21RhvWxQ96z6eKPCcjpN4qFv8Y9/HTxIUvZRPf0h3jg6eMA4LPBkn2H1SQqKE
         kSaA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=NUUWzb4G;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.15 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fARVHRWyf2laCT2lwtbeVZU+L8GMCvB3vqILx1t6ZGU=;
        b=mc1kKqYE8616ABD7K19RPXVKNrjFy7mLphCQUxkkNDkDG65UvjDbryonJqvWy7GbRJ
         4GgJVUO2dVX61z4gNrkMr43O2AcwDKlbLYFm8FIe6nhK7yHP5Rg0q4g+LTglFQfknrU2
         mhKRmmJAj2gIPyhz6mULJY4JoBUT8AY/3dZ4U+RtWmA8sfmaqKCgtT850cePawA/kk2N
         Pd9rIwY2RUB9QEAj7Ewoc+Ij+g+zT+4iYJ+azhg/OL6x7IXME7/ttukic0PRFrLVVKcl
         dvNntkTgxg2PvTBvtRGoAYL7b02uHysF3cn9FB1u5KBv15Lt6t+o2eeUeXCIVTt2iJIA
         u+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:subject:from:in-reply-to
         :date:cc:content-transfer-encoding:message-id:references:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=fARVHRWyf2laCT2lwtbeVZU+L8GMCvB3vqILx1t6ZGU=;
        b=XbaaCabfiF/LfCGB9j5mO8+vVYMNuLTp5IDi3P5fwFfCx7K+cljJAZM9sb6K2nMKu3
         zbPrqXocGqoVM1I3HUAs3kuz6JYs9gawkZVaCVc6R0UWKJavsIOvjRqmBLkw8Pjoa/AF
         B+WOnzMpGSKQw4ZS51P3Gyf7sSn7P/YQ/hOfBgVSxi7UCAfxJGMN/qRAjUsjb9rHZE9F
         LcC2A6eOwDypYxwqheAm61Y7aFPdCvbeg+Nto5ZQHAgbZZXTudJu7dD8QFdmVbMzARPH
         fy1HZL/FQ70UFv1X7loDQp/ELop6zznR7xrC/wUcqfPtOy9qZrKMNSTA4HExz+jgLe9m
         7Epg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533t5a4y77BdNB49NBFDpQ4EB8+YADQ2yDrMVNBDyslp9Ogrdj0p
	Cej6qNgM6kr5q4Not7lTv7o=
X-Google-Smtp-Source: ABdhPJxgnMx+SBCzEpFdUXH1wmWhAiEnuBtx3HWFbkVq9jhxATmmhE9vIMiYNhBgcnO4nMsL/TsDxg==
X-Received: by 2002:a2e:7301:: with SMTP id o1mr2359133ljc.42.1616487302474;
        Tue, 23 Mar 2021 01:15:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3d16:: with SMTP id d22ls4173033lfv.1.gmail; Tue,
 23 Mar 2021 01:15:01 -0700 (PDT)
X-Received: by 2002:ac2:5df6:: with SMTP id z22mr2055669lfq.485.1616487301320;
        Tue, 23 Mar 2021 01:15:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616487301; cv=none;
        d=google.com; s=arc-20160816;
        b=wonJ4d44r8yR7Pnrnnq6qTrGcCEZAqVRHApn63Vtc+XSAL8P0eF/CEN+X+tKitkM9n
         Uq8q/UQsSokt8ovRKRbrAgl0FeM1L8jjytHlxiGskcXiqIieiHcUmHT5+xiRJ2Hpi3Rd
         wYPWELIgcN2xtHIn4YWq0vA8Y528g7SjoZ0tmpdfiem4CN/+Ansfv5LnPq3udRO56sI+
         CMA6690hZ4vUlpIVBxWpPhyTAyV/4KyofJUtfcbIOerUqOtNGEmXrhRKOLYsjHm7d5uL
         SMjqZSAwPfoBpMr8NGSgkUVpvI7YaiQLfuwwGJ8M58tdYezmOXg8Znv32W6XWs50hNF6
         U05Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:dkim-signature;
        bh=6mHy267g8R3FTc2sqx6PsdMu9CLKTOBVwugSzOfD9+Y=;
        b=w+aCr2HJYnQATJbwO6Mp5v6XcRu5w7dKG1oqk3d8hF4wAEVsWEG01al7sE+061OIu2
         HsiGqoRf0ee9F2CiVfLAPjSzVGCQILUm0xEqiLSJswRyV75sH93HCand3mUDjQnrw8MM
         oMpW/h/BbYMm5c9/YMsdx7GZmWlXGpnPqcWKFnH/wua+fMBjm99pnFQqwcBp1TgVU5Te
         3AspohwEEUZNDbHia7PPMWfnDQqPAGEJSu+C3CusJoGN24x0uHTieRPeqGgoHBxUM4Ct
         xSTAGbr77uMtSNmu2/aDQA1qiRSO+SAeOHkBI0JJJS3uBofGbIk+3AfnVmIMuF7D2B6J
         i7aw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=NUUWzb4G;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.15 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmx.de
Received: from mout.gmx.net (mout.gmx.net. [212.227.15.15])
        by gmr-mx.google.com with ESMTPS id v26si710751lfo.2.2021.03.23.01.15.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 01:15:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.15 as permitted sender) client-ip=212.227.15.15;
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from nethserver.fritz.box ([5.149.16.213]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N7QxL-1ljAGE2etR-017oCI; Tue, 23
 Mar 2021 09:14:59 +0100
Received: from [192.168.2.26] (unknown [192.168.2.26])
	(Authenticated sender: oliver)
	by nethserver.fritz.box (Postfix) with ESMTPSA id D80322002A34;
	Tue, 23 Mar 2021 09:14:58 +0100 (CET)
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: Root cell cache coloring in jailhouse
From: Oliver Schwartz <Oliver.Schwartz@gmx.de>
In-Reply-To: <d108cd39-248c-2938-e5fc-7e7afd1b995c@tum.de>
Date: Tue, 23 Mar 2021 09:14:58 +0100
Cc: jailhouse-dev@googlegroups.com,
 Marco Solieri <marco.solieri@unimore.it>,
 Renato Mancuso <rmancuso@bu.edu>,
 Luca Miccio <lucmiccio@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4FEB025B-3122-43E7-9888-FE4816625883@gmx.de>
References: <24D2D568-5334-4B88-9430-86F84E576E35@gmx.de>
 <d108cd39-248c-2938-e5fc-7e7afd1b995c@tum.de>
To: Andrea Bastoni <andrea.bastoni@tum.de>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-Provags-ID: V03:K1:n00YuiPhQuBthXGGWMO1Bf6XWtOcGtBA8XxtoZhXO1BVfco4T/h
 o7VgAfVxiZGeSlppERCIhyDB2ZcCDUU1ipIDrjDB9mx6C7msppB2Z3zjoJF2K9meslaus60
 DsFpjbChHpowiWOdXqgcP4ypvSaVy7mtIuLM6O4CjKSL2nuehu//UE8b/Ne/SkECcuaE0BF
 lD+X1c/QP2zfZHVBbKhdw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LjNtF1ZRQM0=:NVkOetQUExHfvef1HGrykm
 NLotFS8D632twwKuflJYusAAxmi7yHE2Qt1lGf3QREHXwZfWSIo/rWHDW4uLDw8mOg7AX7vLZ
 d57jDTPTYr2aNCCpK0mV1N4V5zdjSdHq933gyi60ClXrzs919PdbSg3pY5xgFEVdJkeqJaKty
 ONZMRV/tTyYBMXgIcf6kqbKVGw04P6KHzDdacuSS6anfworkBzWcilisUjsS7aqj7yHPCYQWH
 LnMtrhaS1kZ/oej2S/cyImitV5VwbocbxzmZWg5vTgchyygtxKhKKJyalymnVdL715Y4TE2KH
 xbIAL9g+1ZcfgkYffS3PmuQvqtM8A1p8bUTSFwebuJ1oPC7gqJDtcpo4E+VeFSFDKB/zn3jD9
 aTWqRQlmQ3wzvPZpktjbwglJWsdAGIzc0jjF1QT+WkxcZXL/P9aKEdVtz0SbxIfNKRWYjGZo1
 y1muxbdPN/tsnOGD64Q6XU6+HXeOycdBYlc8px97s+iVlYUWEpOYaSNfUygSvOIdztyu6o6o3
 WCy4b3D17hd5jNaubb5n62MI6Mk2XBz/iOAQVaoO29X9u66TQTePK4DQm9w8+4TnXT8TQ/VKi
 ODEUhMEjNQ6w+80dOikqEGRbdGEKeSB8duDoPZ3l+yaZNXYAxg08g5aYTpYuGm+acP4dszwXb
 E3tQx8g4Vb2tdsuHFxzz1r2LONo0mD/8xAhTSs1oyG58qhdCSRRLiIsYFLABjXQNYF6JN4ZMk
 cjbc8d5hSq2k1gFGjtpQKxIP4mt5DgF94JVp2XpITHqESQoPDZk6MHp6LuUlkY1dZUvrH+Y0I
 WcDiQ6I8auGhNUioWAm3VSISJwwUkrnXNEG4/QpPR9S7/NHXaGicA7i8J9xMYjGDlazaNs0a6
 Y38irGex0QvWs890MfaQ==
X-Original-Sender: oliver.schwartz@gmx.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmx.net header.s=badeba3b8450 header.b=NUUWzb4G;       spf=pass
 (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.15 as
 permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=gmx.de
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

Hi Andrea,


> On 22 Mar 2021, at 20:51, Andrea Bastoni <andrea.bastoni@tum.de> wrote:
>=20
> Yes, with BU and UniMore we have been experimenting (mainly on the ZCU102=
) with coloring the root cell during the enable phase of jailhouse (what we=
 call "dynamic recoloring").
>=20
> I'd say your timing is "perfect" :-) I took the chance to rebase our vers=
ion of the dynamic recoloring on top of the just sent PATCH v2.2.
>=20
> You can find the full stack of the patches here: https://gitlab.com/basto=
ni/jailhouse/-/tree/for_upstream/202103_coloring_dyn-recolor

Thanks a lot, this is very helpful. I=E2=80=99ll try it out and report back=
.

Kind regards,

Oliver

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/4FEB025B-3122-43E7-9888-FE4816625883%40gmx.de.
