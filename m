Return-Path: <jailhouse-dev+bncBDNPJEGU2MKBBMMCY2FAMGQE3S43RHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB604190D7
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Sep 2021 10:30:43 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id r14-20020ac25c0e000000b003fc149ed50esf15121464lfp.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Sep 2021 01:30:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1632731442; cv=pass;
        d=google.com; s=arc-20160816;
        b=Mtupf9OqDaP1C+cHDCdVYy0+TN5WJcuQK+4WlF1G2fokWj5iL35hs1Ye7vj/FS4BwX
         371Ed67NiHIYW6iP2nhbN4rEY0I/afyTF8zkLHSWLDrjemgnrzvZSCvu7HeKrRD0WWZX
         Xh9xeqHb2J8jQe3V27/k246ZeiQxlFuEmk1kIDcNZB+paGBIe+/P5iLdQYgA8L7xviPs
         GqeTOUuH5JWn2+Li6qSWpE0WaO3yVlNSjjxUhgNO6xO/PTY7n1L7yTw0AojE2JUk3kRf
         cSONVVjnW9cuXE573bfVxrhYtmJKPRkL8HFEaEV1NcQ4JXG4w6Qd0EC/L5Yij4FyUwiI
         bETA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:date:message-id:from:references:to:subject:sender
         :dkim-signature;
        bh=MSFdO5VV10kXb2v8VUZCz7tiU+r0WNPj45QJpoRfN6k=;
        b=0sdoXvpR2kdZK0DApSbRivw03frH0peeG6aLQbYpkNlODoNx2n6q0xAUpRyJAqkajI
         NHrxSnQn6QjwDT7B2lnhCfBrtfArI8QKOS+x52gKtoICP+V596dvMnTVYW2BBvyle4mY
         /BnbCXn+fxBZJSIPimeF1Zl8r/bQ6P2wVWDbEEqvmsZU2bU+JRez1dKlCaWhR+3c25n/
         HEPDhzIlLWj9cB06p+YXn2Wk2r5j4RWJVE1Su+wOi/0wk+JTlEGH5pzhADCzY7kgZQPC
         Wk1GWmwlK0l/FgPurWkZbBru2CeQGOtNR9N4SfZjS0uDj59mOx7km4+k3g/spJCvZm1j
         XDwg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@linutronix.de header.s=2020 header.b=HTBClPWN;
       dkim=neutral (no key) header.i=@linutronix.de header.s=2020e header.b=HkBn4nUR;
       spf=pass (google.com: domain of martin.kaistra@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=martin.kaistra@linutronix.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:mime-version
         :in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=MSFdO5VV10kXb2v8VUZCz7tiU+r0WNPj45QJpoRfN6k=;
        b=kH4DWPiBS/FX1WhtfiZNUNog6OMhNVhkWU/DmH0+TXfGJbP7Uk1Gy0q5QzWr1DHXKT
         94bD6pSglU0icXafNVUclF+xew8huJ08Nm87mE88jTZvttrrxgM6F9YywgcPAHeDAMiS
         iacRondYrS+teuwGU6QB9XHffKmVKx5reUCU6I3Jv8DxbL+dGUhdDBuZDVA0ddGpjTC2
         MxSUEwS0QNXvMFSlzlTgVKAtuWfTBj+Ok7CygcraotlApTUENr6cD3MxrrHQeGp7gn3y
         xQOWb/lR4ROyYoszasOgAsHtFCrXd6+ewbSO5HaOn9oh8fbxW9xsOCQ3nsq0JbWNrUwU
         oqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MSFdO5VV10kXb2v8VUZCz7tiU+r0WNPj45QJpoRfN6k=;
        b=jT50j7Ac881JQlwRxsTCrevDPZX+PC+FrIqxRPB3T7iS0DVBaOqnpKxIcYyIs3w7Jx
         ho9O4KWdAPE3ivIyMVVysQ/RaQ/h+ZgP+o2zangER3BBuwC23fjN37EILZEeJfKw4hih
         DqX9nzVCHRPF9PGJ7i6lkDuVixgEaXhhQXQDi9QArWy1tg2YB3Z4V/XzmZklP30Tj/g1
         00wGYqyLH22SW7Tsm1vUBHJ70CYH01056xquwNyWRHIpGaGMfzAmqr75VimAc/wJQmC5
         evSuyvuqdfx22R5HfEhtbWZiWihma0pFfEqg5AiPSKzXP5Airiwx6BMgnaKe6066+WBh
         uzbw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5315iDKy+Sh9VQmrhDo9XCYK1K4KLenW0L1gxpj0RjQo9DIMV8hQ
	LKdrS7onkZpK6WJuYTxszBs=
X-Google-Smtp-Source: ABdhPJzk2RYdufeWa5Y6JBMFsq3Gkp8UXWDrBbL14o+U/EoqJZg3mIMn4GCuyZNon3Zq+apr5OieRw==
X-Received: by 2002:a2e:3518:: with SMTP id z24mr27403419ljz.312.1632731441912;
        Mon, 27 Sep 2021 01:30:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3f14:: with SMTP id y20ls193508lfa.1.gmail; Mon, 27
 Sep 2021 01:30:40 -0700 (PDT)
X-Received: by 2002:ac2:4157:: with SMTP id c23mr22665858lfi.184.1632731440746;
        Mon, 27 Sep 2021 01:30:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632731440; cv=none;
        d=google.com; s=arc-20160816;
        b=cmKgJefKqwKnESgQLLjjBZ4wMrlrMd/jI/iANyXo9XMMG+fXSCh1AqkKTso5+G7HoB
         +7kTTZ1nwiHPMXX9H32ssn7ZYjJKezDoBM5lpRvGPteiv9j0dYAED4CSHxEySu5A4f0u
         ieWrx2s8rwztonJxsJNqvTYbjqLe7T14rH8CSgoiHAs7vqPr/Y+jVq+SOs9dOscufyCe
         3LfnqhpnuGhaRzoBAdMaCh2FiZGBMIQiwFAlfBEavxSP1cDsiOYLqVBnthPQE28owzWH
         TbCVPPHhmG1ypnrXlcVc92dvwmTkZtFTOSDq6iof1NX2HqV4FXkUg+dXVLVyPSyo4XOq
         NgyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :date:message-id:from:references:to:dkim-signature:dkim-signature
         :subject;
        bh=ZWpCf7qtW7AGOh/UTTN2WqlNHXztsVvYhiE08dFPasM=;
        b=xDcPX3FwmtBIZuWMa0xbV9xHls76InMeK964W41gdynaLfM1VFszzBADwEqwa7Hfal
         RNKNXxOJGyOWeB8QmXtcxDxA1rtJQrhtKawuLG7gOjNDkSQ9UQoTJZosLweymxdcdGLW
         DnJQ2e6k5SV4dZmzAqbSnqG3etw5KhiubVzefrAjImWOcEcat4TIbZLk/4c++oGtWNiM
         QphK/4KdNmsjrFxNVGJwAJtNeJoYudJ4BiDCYmIq/JZK+r46y+CKEa75F0BMzOPxxkOq
         Qkpjp6+EoxxDjFZvm1vFnGNXTzMgWh+N5Fp7L1jZV6ymYPs6W26d5zoCF2eNgK2EIG7y
         pqrA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@linutronix.de header.s=2020 header.b=HTBClPWN;
       dkim=neutral (no key) header.i=@linutronix.de header.s=2020e header.b=HkBn4nUR;
       spf=pass (google.com: domain of martin.kaistra@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=martin.kaistra@linutronix.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=linutronix.de
Received: from galois.linutronix.de (Galois.linutronix.de. [2a0a:51c0:0:12e:550::1])
        by gmr-mx.google.com with ESMTPS id b9si303048ljf.7.2021.09.27.01.30.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 01:30:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of martin.kaistra@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) client-ip=2a0a:51c0:0:12e:550::1;
Subject: Re: cell create gets stuck on zynqmp
To: Jan Kiszka <jan.kiszka@web.de>, jailhouse-dev@googlegroups.com
References: <2ee07d25-ca98-8cc0-3299-3a393aa99fd8@linutronix.de>
 <8092b487-f19d-dc89-98e0-cb68077792f9@web.de>
From: Martin Kaistra <martin.kaistra@linutronix.de>
Message-ID: <5066f207-29e7-4576-5b06-c8f260c4d10a@linutronix.de>
Date: Mon, 27 Sep 2021 10:30:39 +0200
MIME-Version: 1.0
In-Reply-To: <8092b487-f19d-dc89-98e0-cb68077792f9@web.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: martin.kaistra@linutronix.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@linutronix.de header.s=2020 header.b=HTBClPWN;       dkim=neutral
 (no key) header.i=@linutronix.de header.s=2020e header.b=HkBn4nUR;
       spf=pass (google.com: domain of martin.kaistra@linutronix.de designates
 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=martin.kaistra@linutronix.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=linutronix.de
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

Am 24.09.21 um 17:46 schrieb Jan Kiszka:
> 
> If suspend_cpu() does not progress, the target CPU is not reacting
> properly on the request to leave the guest and service the Jailhouse
> commands. Could be that you interrupts are not handles properly. Run
> "jailhouse config check" on your setup, maybe you are passing the
> interrupt controller through.
> 
> Or are you using SDEI-based management interrupts? Would require a
> special TF-A version, so likely does not happen "by chance".
> 
> Jan
> 

Hi Jan,

"jailhouse config check" finds no problems with the root cell and inmate 
configs.
Also, SDEI is not active. gicv2_send_sgi() is being used.

Martin

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5066f207-29e7-4576-5b06-c8f260c4d10a%40linutronix.de.
