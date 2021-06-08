Return-Path: <jailhouse-dev+bncBDOKTXXSZADRBUXM7SCQMGQECFG6R2I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x63e.google.com (mail-pl1-x63e.google.com [IPv6:2607:f8b0:4864:20::63e])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E0739F22D
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Jun 2021 11:20:19 +0200 (CEST)
Received: by mail-pl1-x63e.google.com with SMTP id z10-20020a170903018ab02901108a797206sf4636598plg.16
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Jun 2021 02:20:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623144018; cv=pass;
        d=google.com; s=arc-20160816;
        b=EN/Ig7isq4vtHbzVQWOpvocrX/mDKv8s/mIEd7YZeSoN68tWgg29u8ZxA+idkdxvjS
         rMH2bsinel+/qCV/pk0W/N4qbn6JR2wbOzG6rd1Vwf8n70N2jmLPR2PXbXP6OGnx6JL6
         ezqHp6Rw9I8p41S6t/3zHps3Y1Ns8ahd0x+2WZ8iiNte2HOf2r1H8gnin/SWKYIhUm5P
         btdErYVafdU6o3RUuhD6yy5quFT38Rc8KD8O812HSzbVTd7I2CBcEBm56XJzye7ktExg
         wsgz3KRi4bCnbHBPmIwX8LIX1sfjJJLdLMmPSkZXAefb03jEe8ECrLzH5s31kUyK5QIl
         7d6A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=XOY7Y0SSCSumUQoxxpf5fB3Xn9frl9BSEhvVEEuzDFE=;
        b=O1ve4ulbkSi55IEf5n2ljkpesxI0ENfDd5ENZ5LxChfakR3Z1MSDtaOkEL/CwrwjOn
         xcjUFqxybGMcO0zYZfQjK/21/R+DDGi/k0TwYIJN1lkOBmbLqGAzUNxO2vVsafI12Zh0
         4ZJVNG+crEgcb/2ohNtlO5zdEES6fY5ZZUrOCEGbWhMmgK+oyJczECKgAQXbITaNLHcz
         NNO8gF7k0Y0eFR7g2nPMuo5N11kUVeXyF1D5RGeYnJevwwvybhgOb60miVwmmkzMmeVo
         9tDSRW6OamSYIznVWViAfsYchDI4KgkVffehLIjZVkMlH66utgNr4fbGFWr+2mg1+pJE
         M8eg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=RPoV7+pT;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::843 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=XOY7Y0SSCSumUQoxxpf5fB3Xn9frl9BSEhvVEEuzDFE=;
        b=Ae6qnL3ecoFSqq66gmEWvrpdz0Rf3p2++sQ69/m5ECNEbcEx1VKl9k0r9hMwbNgKiQ
         XRAQ9lbxJSeD8G48AkSWNpQxvpSlmwQRMXPzPOlifKvyNIkW8qLwIusXOKbI3lqo9Oxq
         bs325cD1Cni+aqeOrv3PdSJuVZE5Ges0r3FSdLt3sYWYL/u3yNJAI8VMDWDcLRwjH0b2
         t9Lv5/oXBtso9VQqIZidd1OEzJ29zwE8/lmB2qG3qlkY+UHaC2uExfpDItIhzaDJISEk
         jIsmraTWC9YbKo1pOS3egwQ2j4JRlXHzLshZ0vLlHYBJGaOdfeJoOtmdaycVoofYqet/
         tK5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=XOY7Y0SSCSumUQoxxpf5fB3Xn9frl9BSEhvVEEuzDFE=;
        b=fqHcbhZod9/KMT1CNyut92x5sgZkTfvc7Y8T/1eF5myYHpTi+95OId1KDtLuxqu1DY
         B8ED0yTP30fQDqnBEgWTwgPEux5VTZv1TxD4El4JOvlOSLPkwSdcGMXKfdUyAspzfLro
         5/oGMlJYhzk/8npmrNvNe/g6LqzpMhDCvNOjbSglczRg2EHpCfLfc9SVzL/pERu7bdE4
         RA9lwHFClW8nqaBL3+B8ZyXBblKGI+54bstZ21CJcrabqdT3JUAKahPCK2Z9XHtGEgnC
         9VbybRE0XSq3L2oFr5DPKk46mI8TdpsHhomdL+1STriRcQjkGeFcmRXTriY+KATJAonJ
         TqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:cc:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XOY7Y0SSCSumUQoxxpf5fB3Xn9frl9BSEhvVEEuzDFE=;
        b=Rr50ASK7JiaWprO0FNboDXPdAgTLeS8sAswLe1eMHfpouMDOyZtEtHuDOdjYrjUNHt
         5nbCubQmYlAc46LNoI46XDDcUBK8x0twEez10XZNq857fApD8X9NI+7euXScvY37Ty7y
         NEj9vgg58QdyzjpGmmVPOOamy/X08bCWNTfM5OoWypU8mRUhGeg5h82rF+RyAuTbMbda
         bYq+CpgflTEQgJEwzctS0OiNdki9NDFY+Z92KKReaW9ihwk7LXu05EBtLdCynNpLfiQZ
         OdNYzMRfqLUEAcF+PJ5bIw6ZczQFdyT5/srxVwd72FhAACHRdwkTaJ0vPT0wLTC3cHuN
         WKdg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531ECoS2KWXIvbM2EDJURmEQEEmT4BjleXTDUwiqUtzdj/H1kZuj
	onsPKxa/0MTGjbetsI2jC3A=
X-Google-Smtp-Source: ABdhPJzMoXHUr2CFqsKPp28CaXYvM1Lk4El+WlgUnhqHhhkEUc02gk7ZUFtVmtDzoarZz3P9rS9r4g==
X-Received: by 2002:aa7:96c5:0:b029:2ea:7667:ff3d with SMTP id h5-20020aa796c50000b02902ea7667ff3dmr21272033pfq.52.1623144018529;
        Tue, 08 Jun 2021 02:20:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:e804:: with SMTP id u4ls9294869plg.9.gmail; Tue, 08
 Jun 2021 02:20:18 -0700 (PDT)
X-Received: by 2002:a17:90a:8c97:: with SMTP id b23mr25001427pjo.74.1623144018046;
        Tue, 08 Jun 2021 02:20:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623144018; cv=none;
        d=google.com; s=arc-20160816;
        b=blxZd19AkFDmk3i2EgIDaSZIzeiKK9rG7jiokQMEVuHwdCm/W18qEbh9iNjLbBAEpm
         KxXoPCVDdlf4B76k6mC911Cee1ahkk5irgbSTE5WOc+Z4WqrakB0GK0Nz7ptEOs4RAnC
         iKBfLeSXSAXfIOqbHDeKlPKBk0vsgzMnc8yY84GyLc9m1lrZ7BT+1yavALoG0lAZf15b
         NGqAl6Dvm8pbjMgVZq50PsLSuk/BPOP8VjO2Q6q3TxDj2tOdL+G2uGDPILpjx3vj3gwX
         3Cq0AYmNQAYJScia8O7l6uOG8hyBcX55FZ5HQPy7J5lXzP1+hV+t6OFOO546bBlyKiH3
         Yo5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=iY3ovZeCdT5W6AjAHGZc0uUrKjFjqssAGuk27+uByy8=;
        b=ZcnMmtk0FGd7Vifmq5AnPJaWmXd4C3OMdTrCiNHIU3YNzS6XrIjbXEerbkAb4g5GEs
         an0SW+2Iz8uNHoPt/+PFWRhSzrPZK07fPQf2vQCn+MBwxCBqwOf4VOdkzd5jhtEAa5v6
         mEc1o3zX+3HVE+DpQpTjTFTGrUBcsrD5Zu1/dQ+Sv+6OcC/NUlZSL98mrQE77NLphH73
         x0ykPg/Ry2XOOZLDFf5EjjbDqfLWXO7ketKCtRiOmulY9YJfIMmsmiqOM/2F/Sh2k96n
         EtLH/bO0nWaiY+Zb5Zd4jE3G5MIYOMkf0g9hMavF0VshFmq8cw+3ODMeG25upLEMR8gg
         QLgQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=RPoV7+pT;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::843 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com. [2607:f8b0:4864:20::843])
        by gmr-mx.google.com with ESMTPS id o20si1648594pgv.1.2021.06.08.02.20.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 02:20:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::843 as permitted sender) client-ip=2607:f8b0:4864:20::843;
Received: by mail-qt1-x843.google.com with SMTP id v6so5834836qta.9
        for <jailhouse-dev@googlegroups.com>; Tue, 08 Jun 2021 02:20:18 -0700 (PDT)
X-Received: by 2002:a05:622a:134a:: with SMTP id w10mr11336363qtk.201.1623144017155;
 Tue, 08 Jun 2021 02:20:17 -0700 (PDT)
MIME-Version: 1.0
From: Dongjiu Geng <gengdongjiu1@gmail.com>
Date: Tue, 8 Jun 2021 17:20:06 +0800
Message-ID: <CABSBigQATXq56FGPcsYaEhbPKAkfgW_q9j3ZcRPA8z-eK9v29g@mail.gmail.com>
Subject: Private Per-CPU Data access issue
To: jailhouse-dev@googlegroups.com, jan.kiszka@web.de
Cc: gengdongjiu.gdj@alibaba-inc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: gengdongjiu1@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=RPoV7+pT;       spf=pass
 (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::843
 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

Hi,
     From the jailhouse design, the Private Per-CPU data should be not
accessed by other CPUs except the current CPU.  But from the code[1]
and my test, it is not. For example, the CPU1 can access the CPU0's
private data, because hv_paging_structs already map it, and the
per-cpu page table will link the hv_paging_structs.  is this a bug=EF=BC=9F=
 I
think the Private Per-CPU data should be not accessed by other CPUs
except the self CPU.

[1]:       err =3D paging_create(&hv_paging_structs,
                            paging_hvirt2phys(&hypervisor_header),
                            system_config->hypervisor_memory.size,
                            (unsigned long)&hypervisor_header,
                            PAGE_DEFAULT_FLAGS,
                            PAGING_NON_COHERENT | PAGING_HUGE);

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CABSBigQATXq56FGPcsYaEhbPKAkfgW_q9j3ZcRPA8z-eK9v29g%40mail.gm=
ail.com.
