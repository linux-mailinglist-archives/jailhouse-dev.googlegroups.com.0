Return-Path: <jailhouse-dev+bncBDRKPIXWWIFBBQE3T7VQKGQEH4GBOYQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C319A1AC5
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Aug 2019 15:06:09 +0200 (CEST)
Received: by mail-ed1-x53d.google.com with SMTP id m30sf2117779eda.11
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Aug 2019 06:06:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567083969; cv=pass;
        d=google.com; s=arc-20160816;
        b=FlqeN46rbSIIRQByWKiLJmias8W/HV525quqaZqZ5GaTaNovN4dnCN+3qjUlUyETHG
         eaYHWLSl8++NC9EpFzUt2AP7Hk8m4a1M2gWH2jqDkJPw5i6hDJZfYCycILLm+STq3TyY
         OwP06CCHSGDtat2s013lbRzaVcRAVfjIgYceEdM4yM16tZMKfL0sAwfViIn228GWgINf
         g7cNRgqLTxoblYSOcSlHTqo/UdeW6+Aq+a4lf3cLsMfY48v/gNSpYxMeMtuwP/PYoTxz
         oluEmdm5tx61zTEncAJ0Fr1IxKjFYE1prZcjRYRf/g8hHkT0WoE+rd82bIvF83Avvgul
         fSbA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:references:message-id
         :content-transfer-encoding:cc:date:in-reply-to:from:subject
         :mime-version:sender:dkim-signature;
        bh=VsV40EJCxbzKlMtbP3DImTGVN/yW5PYdnoTejsF9c/k=;
        b=Onj/5HcPJgxIa2Gugak1d11l97GMJ19ZGU32ErDSE7b7mgRHsNTx18dBAkM0+llmr8
         qbZT+psUs0z0WD68n3rPYReKsdNYkRj3Wq+ah1Pc32XxatlW7XlySFIQ6HB/2J7vpc/p
         HrYmegR5Tp1BapffLpggfMMJZZKqaLUwlCaHFGhtFQ2rIfhyLaDs8UPJZ8VeDUuLTtVI
         uX4QbQeFJ5Y1TY1CXQN3A92kycqFOqrQRUAPDxGDuhVByc+Ty22Zd7usUbyYLExGdh30
         lRHwkP5w7sL9WNQrD25OSjjZHWaqboqBpCjnzgjueyuHhKZlCe5Y319jEdgP2Iy1eKtA
         eAhA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b="eh/zaE7Y";
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.21 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VsV40EJCxbzKlMtbP3DImTGVN/yW5PYdnoTejsF9c/k=;
        b=R6F9h4xAk0wwtXOZ/qG54Wch6m5Cxte6e/yEHi5ljep3qaaosaGA/2eHv+gW4yvzBC
         vltBpCoGs1vyy66qTERSQ6aQpIVmj28ipbYIBzMI4R9cN0N651J79xqA4MZay0O+2Mig
         KwF6fDvThtNqb3wQumGasIWthrtRfqDDrBOkBDa6hDjapmrvJSwsNw39iajcdh3vWSdt
         BJQH6RQ/Qt6crmpmjLUTqDMa+7WlNpFm9RO891q2s6Ld5S6yCJmnhc1kiALNCuMdmhmp
         rZXa70fsP87lmBp6rH/S8oVM/8FfEyDHT0vHXHCiR/dJ/mbo6a/ziV2DHM6ibNSckwzK
         FljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:subject:from:in-reply-to
         :date:cc:content-transfer-encoding:message-id:references:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=VsV40EJCxbzKlMtbP3DImTGVN/yW5PYdnoTejsF9c/k=;
        b=fLN2WR+WzDtlsRXmtKakp1NkLreYbuZDZcMR54N2Ns5uNUkXIHKLRN9r5BZmL3NTrB
         hsgWFSdKwWGOJVdp3xdvtBizHVBBWgeokdc2t2/GMqG+xgOGewFJ/MrdTAKb+HgP3SKg
         mbGYRXk7wjZT/LZXiquzhtFHO3bEhc75/Ob1Gw7BzXVAs6l1525/3k7JCBq6m15wezlm
         asMcnZfMn6QKpWKJZMerokdefpupYt1SObyT1JHnl8NiIDdbsUIAUlwxbKnJsQ5go2Gz
         036B37fvc8MynqdfSfOWDdSQAY+y3Nx/UJ1tMuu5vmaSLrIpBFhHZ3q1MolqXatuhhca
         Samg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUXcpkbK4aFRcaSi4YeTCRhLfM0sv3oKGZ9kM7PVqoFSqEdThOL
	3fRRQ9dj8OHJX1BwjJbwAzI=
X-Google-Smtp-Source: APXvYqzqPb4OTXgFgicyh6W4TZVRPuDsciy41oQ4VtIn4dEnCyhqiqUApVKHr0at1js4CbCFuekcmA==
X-Received: by 2002:a50:bf4f:: with SMTP id g15mr9548501edk.92.1567083969068;
        Thu, 29 Aug 2019 06:06:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:8052:: with SMTP id x18ls761396ejw.10.gmail; Thu, 29
 Aug 2019 06:06:08 -0700 (PDT)
X-Received: by 2002:a17:906:3fc7:: with SMTP id k7mr8195549ejj.208.1567083968171;
        Thu, 29 Aug 2019 06:06:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567083968; cv=none;
        d=google.com; s=arc-20160816;
        b=kUL97GF6zds0ldUvD1L3i2vY3qGuRk7B1h4uR6+t22YdF/3MTP74bzx/NpzMZrnPC1
         +PouW5OC3ddrtABj6fprIoEmeTcLlKndbwPk37zUtMbVeZQFZMC/tOIKx5vD18xoI89+
         lTaiqnwaw/PrZf8Q5tg37npwdDbEaPQ5wnw/OmE09W5aBgcCmrphF6XXE7gWTDi154mT
         MuJcE7qcUPkAthIoCz9xrPuf4NbRGXP4GPC2QFy3/tc0SOrm6ZvAvcrRo9o3DjI2noOT
         K0B8fBGgZcqsd8HaLW9aoUNsFKPYpX5h3b7j/VzT/UcLZPWZwVWgGfNGKIKFbX5moeNR
         HeNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:dkim-signature;
        bh=bFXceQdcCW+w7xkTEiJgs2UqZ2JA5aTkOeIu4UpVzZg=;
        b=v1hyGt55FNB73+Cmc4EeUaVKhqbXf7781+jqsXS9gONuObPv+6synsPl1Zns94N4JV
         9SWpokzX6OAqa4LtD1YEsj0ZQUeTILcZZKRIlwV2glsk2cICV+EwIHHYo/U7IeYMu5l8
         NdcrNBS/okKUUWwYezBQ2I6pcsMCaX7TQ7PZgvLDv+kfhiKqt9YLb0JmdPX6IxA9iLb5
         5t/p704apdieX/pIJGlxDPM2HHvF0I73wVhTLFIgvoZcfE4ZQNmKitAaIY3ThhOvW2vK
         O/hnqTPyEXJRy/eWd3Ivgt6LU7OHnHNU+Db9sthUx3OVD6oXqhvfAgVK5zASGO1uWcJT
         MdqQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b="eh/zaE7Y";
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.21 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
Received: from mout.gmx.net (mout.gmx.net. [212.227.17.21])
        by gmr-mx.google.com with ESMTPS id m29si158515edb.3.2019.08.29.06.06.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Aug 2019 06:06:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.21 as permitted sender) client-ip=212.227.17.21;
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.0.0.213] ([212.126.163.234]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMGRK-1hk0K130UQ-00JFv5; Thu, 29
 Aug 2019 15:06:07 +0200
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: IO access in jailhouse root cell
From: Oliver Schwartz <Oliver.Schwartz@gmx.de>
In-Reply-To: <a77abfcc-9856-0797-caed-0c9dcc62b07a@siemens.com>
Date: Thu, 29 Aug 2019 15:06:07 +0200
Cc: jailhouse-dev@googlegroups.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <EEE90634-7719-40E0-8AD6-056999F8EEF2@gmx.de>
References: <76008E6A-1653-4358-AD31-4C8D332759C1@gmx.de>
 <fc5e2fab-3339-2dac-0a61-7a3647873a42@siemens.com>
 <7297AC93-068F-4C6F-8486-222D62F7D1EB@gmx.de>
 <a77abfcc-9856-0797-caed-0c9dcc62b07a@siemens.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
X-Mailer: Apple Mail (2.3445.9.1)
X-Provags-ID: V03:K1:Vefl5zUNQTeww68x6XRNHua+nTrYjgQ7QiFrnWnvRnJziZ00fwb
 +8Kk8ghPcSOH/qapDGiguBzwlkgiOsCqyOrupFUCsDpN2kUk5N6heD4PZG0g1RztuIQfqhG
 6D9lwqWcdQ/E0tz/VQlfB5w24uMRKInocqwLq4KC2cRh1ewSpfB6oB9ekp3ERmjgNfyqDdF
 aQS5fjO+uAzOBFm5jOkBw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jBWuvIITWL8=:lzgH0ABAR2+qz/3ZE7bXcs
 mBMkJkFSmSV59QwFO13u+ihzqtpqDUPYvHHpHgO46hr2e1lRBfaJfHDS2MmKMg2VI/meS7O8B
 4C2iuKrVChXggq3qq2apOSxdw8q85t3Iln8VSYGLDYqUYHJcLths2QL62ebqxOXjlI5Laovt7
 xfzZnkvi8X2FfMhigE1UKLEnyzQDflYmMGcCX/FTWnmUuwUxBPAjqi3TGVWgdeQFgH9WARwaD
 3gJ2nGmWo+tMIXO8J2zlbGB4lOPDaUqTDG65CIIwOtShec0hQWzZdTOqpfegc/nA4TfWJJJ2J
 gOIifR+vx9AjhZ0aG7M8QflcFqrWOOWLovchSlUsRyy9ZaulIvm7H9+ZMJpLw+CvkbOJ2YPUO
 nPFUAVQwVC7TnHV5KR+XdPxnau7ERTDopXW8kJp/PfZu5clS+W7SexX77i4YAaorxAV5tGYNi
 enBy5RbqtIvaKi1S+k9ceJ8XlswPctybkZcSV0FXpi+sfA/PdmkTsDr3+v7IIkrK1cS7znkAe
 zk/AtZILUOUwegl0dzYAaHcfq/Idrs2LwKa0VcNfdz6HwzPW6f6wjzp43TZfHQ9S32HLMuHmu
 17Bb92OdXOp65GzsrPgTV0dNEYU9m3tAzioxmEFiwE/CSs2+76/BlV/eY/DhPsK/CSydanzwr
 1tLBMKCNgvd0Qjox7Iti9OLuf6Bh8oAACzEOrYnmAYZtPXckWMHhOPzhJkTKCz+loutxUgU3T
 mGYlfUPE5Rl6vf7uP/2wuH/QXBaozYgE4KbVy4uMeX9mG5Er0LLunRtivyl0DKBrX9eJ/NE8E
 GWGbDm/u1YXzyU88C+7VZzq/1Qzka8tXj7FS39ySdzjrhfAZflFD5V3LLFg9U9G4g+PPRE+25
 g2HNmPHeUnPBH8w/2wK3IGiIQb2+Xzt6Kw1JLAVpTJxyDg3DcAXOti2Pqn9c+zstHLqcqLFaT
 yXsXmkXwlp2CRXppAX0ntex2SRCq3bzzwCBzbqzGMP3bNOflTgqprX7zHmZPEQO+VPfrA2A72
 klss4dX2VnvqG3G5HVEkIQx0ut4KDXquk64ZAPXpo+M5ePwYe7STTClW/vgdm/YhV+3fs0Eu7
 ZNpX1X0F+qT4PHoBCaquCUPWVDXkKva5l91ru5ER2Hh04G7us+48YTFwkx8LjVJCw5f4kPyd/
 Ovi12w8OziAsQ3C60B7RLJ4WJb7+asUQk+urRXN35HUfPKnw==
X-Original-Sender: oliver.schwartz@gmx.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmx.net header.s=badeba3b8450 header.b="eh/zaE7Y";       spf=pass
 (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.21 as
 permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
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



> On 29 Aug 2019, at 10:08, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>=20
> On 29.08.19 08:41, Oliver Schwartz wrote:
>> I=E2=80=99ve now tracked down the error to power management, in particul=
ar to clock gating when autosuspend is used in IO drivers.
>> The drivers in question, spi-cadence.c (https://github.com/Xilinx/linux-=
xlnx/blob/xilinx-v2018.2/drivers/spi/spi-cadence.c) and i2c-cadence.c (http=
s://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/drivers/i2c/busses/i2c=
-cadence.c), use autosuspend and turn off their clock when suspended. This =
is done using the PMU (Power Management Unit) firmware interface (https://g=
ithub.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/drivers/firmware/xilinx/zyn=
qmp/firmware.c). The firmware interface can be configured to take a hypervi=
sor into account, but my guess is that this is not yet handled in jailhouse=
.
>> I haven=E2=80=99t yet figured out if driver autosuspend can be disabled =
by some kernel configuration setting. However, I can work around the issue =
by patching the kernel drivers to disable autosuspend.
>> This also effects any other driver that relies on PMU functions. The CAN=
 driver (https://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/drivers/n=
et/can/xilinx_can.c) spits out a message "pm_runtime_get failed(-22)=E2=80=
=9D occasionally while jailhouse is loaded.
>=20
> Interesting. This driver also exist in upstream, but not yet in 4.19 that=
 we use on the ultra96. Which of the communication methods does it use when=
 talking to the firmware? SMC or HVC? Should also be encoded in the device =
tree.

SMC is configured in the device tree (obviously, as there is no hypervisor =
directly after boot).

> Anyway, I would try if things still work when disabling this driver (CONF=
IG_ZYNQMP_FIRMWARE). Interpreting and moderating guest requests would be a =
task for later then.

CONFIG_ZYNQMP_FIRMWARE is selected automatically when CONFIG_ARCH_ZYNQMP is=
 selected (see https://github.com/Xilinx/linux-xlnx/blob/xilinx-v2018.2/arc=
h/arm64/Kconfig.platforms). My feeling is that disabling ZYNQMP_FIRMWARE wo=
uld be counterproductive anyway, as starting and stopping CPU cores is also=
 done by the PMU firmware.

Oliver

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/EEE90634-7719-40E0-8AD6-056999F8EEF2%40gmx.de.
