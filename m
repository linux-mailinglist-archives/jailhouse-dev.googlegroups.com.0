Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBDUW4HUQKGQEBK2VTUY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id AC41A72E7E
	for <lists+jailhouse-dev@lfdr.de>; Wed, 24 Jul 2019 14:11:58 +0200 (CEST)
Received: by mail-ed1-x540.google.com with SMTP id k22sf30109780ede.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 24 Jul 2019 05:11:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563970318; cv=pass;
        d=google.com; s=arc-20160816;
        b=k1X9aj7IszfjHU74602YOL5jG7+ojjbHup5rowkNKcFmWRzKgZGbi85veDKWMyScaf
         ukxdeRnnKGtAH3x1kVf51VLOifefeUhFTyK3EEj9CTmDs5NaKClxOkVYbasj4z6z0d/9
         8NpJ6Ta32P4W5J67ucEaPR9URqO3dOFbuJIopnxnk5o5UgpgBJOZVurCCUes7UjGKphB
         aIe8IWIhwPR0Sso8N8QMHsvw0qqck0QXnRD++o3ASTWgg9nSe8GDFUetBRThxMn1Z5O8
         twl41aEO2Xu5J7NiKc1gEIvx+jZLH5O/vx3pxRusxmSGlc6NSeUshhX+w7c30Iodf1kf
         3sxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=9e1RHl+5BxH/NJbVEa0UV2PtJu3qK6xJEchfQIT7JUA=;
        b=TowTNr7Xj8j0CTszYnB41Zw4bk4OjdOLo/crPoDSW9UfDxXFfVvdafw3u1HSFN7RaN
         z0meGyZ3xmr5cUSRa7QR2vZh/2IzBsSjKaSblV3CcXYj7lGNY5yEItVzGn5seEfFw17h
         VJ1+Uby9jnMP94tEuydTqRpwA8scrMSlztwWHnLPiAPJ1CMsqoc9QS5pD/kRPWbsG/mU
         Y/CDnq8bUpmyPUzI0ypTCJekkYADI8izT0oKMistc/JDfSgdqKvUByi5CdtMbZ8OtAda
         ejfMVypiF9fK49Y+bVzcolU6aTzf8fiprktDtS64AlaLW2ZLdjD7YdBMEMD0dGrCFV3i
         Q9VQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=9e1RHl+5BxH/NJbVEa0UV2PtJu3qK6xJEchfQIT7JUA=;
        b=ZKJAkP+Eh0dsJEC7wnbNEQjt6fWs+Li+jZyXLFnn8MkZTn6PXcbdHwqHN/Em6dLXFw
         mnhNBGAlZyraaUDhLUS8qYLSIhZ3VQcfI8inPWS03vJ2Us5Yf3XfQIvf3GzX96joAqpG
         1063FVpcCpyR6Xo4JYNQrquKSu/54Nb/RRg/UvMu4NDxjLYlHPaNybn45fwh5/TtPqgS
         JLwchWO1U77kV1bh293PZ62+4x6ZwTeW/f283U5pr4UdajqnmJhDldgh/gfxS9FEjP/f
         pfWTaC2/yHCLnPVwvH98+RZmwgHStUXYWx7sgj1PFLX9iowgnTis9py3moKLQ/IQL19Z
         vsgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=9e1RHl+5BxH/NJbVEa0UV2PtJu3qK6xJEchfQIT7JUA=;
        b=rL2+0bdxGs0i2btYSv8pC6ZhsF0SFJydxb7h1a5nk/g1nDkZFluUGKNG2+9L0qdlz7
         fZMW6NI2ZqLagSYHZxrwRXJuUSkCOulASHjyZYlwwhg2qoonkrqCjRCAIyQoTcreDzif
         RwvBMDAQMVMGgJK3ZGjfndTLoZomTe6TYS4ZpHs8pfueEiQqpEy3TUBsoU7o4ah0jRq1
         zIbzcenHYOrKHWNA8Q+1NphVtugI60aBXc6gnaXk81b2ix1dVzS2Ex1rzx6oY9Vsc52L
         /KZsPP7+jY2zZOBFjjRS/r5ViRGmEq1NwinjdYLSf+yaImseEj/7HTR7J4nBr0l+rRRC
         lmyg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU4LUhz+cXOlpw990GINimXogVCln7ojvCqllxxEvmmj+VgtywS
	MFX8VncEk/ZhtBrZXaH82yM=
X-Google-Smtp-Source: APXvYqwRK0yeAubCMHV8x0U0SOXwE9EiH4bpiGxSU1FyTufvFFyTsJzXfHsqGIwV9aEjivqniPGYvg==
X-Received: by 2002:a17:906:454d:: with SMTP id s13mr63376134ejq.255.1563970318301;
        Wed, 24 Jul 2019 05:11:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:7f15:: with SMTP id d21ls9763007ejr.1.gmail; Wed, 24
 Jul 2019 05:11:57 -0700 (PDT)
X-Received: by 2002:a17:906:4a89:: with SMTP id x9mr36039069eju.141.1563970317695;
        Wed, 24 Jul 2019 05:11:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563970317; cv=none;
        d=google.com; s=arc-20160816;
        b=qhYIi0k4POGda9ML+jPC+95iCIRQQ4MI4Z3lnJ79xde7UOXMZvT/c0xQIWrxobjhqe
         dtwfX9A1gEd0yGnq7aAaelmblWIZw4+orcH403MJsrkIraUWtu6j8KKN+s+eeghtRxDc
         j6QrtqEasMAwml3lGSoZrpZh5LbmRrkSvmqRNA/VSPYU0kLt17DiJwUmi2qM4Iz9cOCF
         PlI1jGDcSe4HFtO6txoas0D2qfACVusB4PJMFZ1ARMr1CuOdJj3rG4iGkCcxYaupDFLz
         yq98k56l2AQewr2Y3nydbdS00iGTwohYgjggfCnyd5hpPU2aT2vY/VDOu8RmjKrQWV0Z
         TOUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=3Ezoj+CNIfiz+cqcgOR06/cAr+lxa4nq9mqHD68Bl14=;
        b=S5f8VN81/iZtDwXkmLMy8BIReMDDP0HeSQtp6NlO8mLrInYJxUZ1br6K1E/qb6Lndc
         GD03HExtdiyrpYqGm/usSY6saBcMOJ64KX+jS4iYhnV6J3VtIvgl4QFTv9gUSY/RKDuS
         6rh8YfSWcLHM8Q15dWa9eUSMFDsSoEAzJqt4+IpheTYGOvGTU0ux5onh3/2W6F3q/NmO
         K5nixQ1Rq66lzUIcbtkip8EdOL1KvC//ql/kHDDjoW27Gh9agtYyA+sLQtIrAITlOjDu
         W4KApPLlwitzxSasePixmCvtYv6tDekzXmMoRzxYCNJ/qGwFuTbs+3SvpyyBiFWWKhte
         cLHA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id k51si2645065edd.0.2019.07.24.05.11.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Jul 2019 05:11:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x6OCBptD029242
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Jul 2019 14:11:51 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x6OCBpis001496;
	Wed, 24 Jul 2019 14:11:51 +0200
Subject: Re: 64 bit Hypervisor crash at 32 bit WFI instruction
To: "von Wiarda, Jan" <Jan.vonWiarda@emtrion.de>
Cc: JailhouseMailingListe <jailhouse-dev@googlegroups.com>
References: <95F51F4B902CAC40AF459205F6322F01C4EE0E3CB4@BMK019S01.emtrion.local>
 <20190722094752.GB28400@lakrids.cambridge.arm.com>
 <95F51F4B902CAC40AF459205F6322F01C4EE0E3D14@BMK019S01.emtrion.local>
 <5518ab89-15c7-c1c2-c56e-f840cc296cec@huawei.com>
 <95F51F4B902CAC40AF459205F6322F01C4EE0E3DBD@BMK019S01.emtrion.local>
 <674c6cb2-62ac-456c-2a5e-ac08e94e0262@siemens.com>
 <95F51F4B902CAC40AF459205F6322F01C4EE0E3E80@BMK019S01.emtrion.local>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <9d7689e6-9627-3be5-9a13-6e984f4ccf55@siemens.com>
Date: Wed, 24 Jul 2019 14:11:50 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <95F51F4B902CAC40AF459205F6322F01C4EE0E3E80@BMK019S01.emtrion.local>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 24.07.19 13:47, von Wiarda, Jan wrote:
> Currently I have a problem when enabling the root cell in QEMU, which I couldn't investigate further yet. Hardware Debugger should be available soon, though.
> 
> root@imx8mm:~# jailhouse enable /opt/jailhouse/configs/imx8mm.cell

You want to use configs/arm64/qemu-arm64.cell and the qemu command line that is
specified in the README. If the latter is no longer working, the on from
https://github.com/siemens/jailhouse-images/blob/master/start-qemu.sh does for sure.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9d7689e6-9627-3be5-9a13-6e984f4ccf55%40siemens.com.
