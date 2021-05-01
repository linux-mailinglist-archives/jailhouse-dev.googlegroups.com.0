Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBSP6WOCAMGQEMIFWBZA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F69370623
	for <lists+jailhouse-dev@lfdr.de>; Sat,  1 May 2021 09:12:10 +0200 (CEST)
Received: by mail-lf1-x13a.google.com with SMTP id z2-20020a19e2020000b02901bbf223e20fsf352098lfg.13
        for <lists+jailhouse-dev@lfdr.de>; Sat, 01 May 2021 00:12:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1619853129; cv=pass;
        d=google.com; s=arc-20160816;
        b=LKsMMiTfjQei8bwWBFEEHyTOoz3wzibSeDexX9MtuIRetnUp2Q0h8JR9bsNZHW9aNj
         Sxs14hc8CRgFPckGulNr0oIFbRq5/h9VBjHup6PIVsAm7ma7pjOFAK7cdHCCpNHV4n5f
         vaE6IvbNS1hxYOgX7PTEi5oV0qe2t2T637/SbvBZOdkaAqgIBvwk/KgfwID+P4BA116E
         M27UKnXSwkRRcOCpSX1nJRK/8C0/8IaCGCo9hoFgv+P0ntVxcugyZuxp70qhy4v153Qq
         MK1ohfoFqxnqrzY1/HclrhKAlMOZlLnr3fnzs0NEOK18ixpmuYrahfq9sZFbUPcEm+mw
         IlXw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=HG9JQK6wVSOPMPtmQ+YWgrlL7WV5NMBZ/S/6dcyIcc8=;
        b=upTi9du1AOtoOyh2TByKySiesNsHtEQgxHVSq9cTdeOYy80kf4y2ggjaND30WvTYd8
         SRh9yh+ia6GCAzYB7Hs472pgZio9EVEDMEMGKk3TxNuDFEgyTdV486PX4SFDz8p7R9kR
         ebVtJOu7eczSGJ6YAKLEBMBXR6F+/eHbpG5bB5eCp53WK2UqwyccfM5mGffDALvI1LI4
         giFNJYh6MeGjrFfzVXIwGuq2e1T0SrOCI5bWB+9iWUAlkmTH+0crWKXPd9uwFceTFao0
         djPU9efPLze3N/qyN/fLAJeT0jYFjhrL29sQU6+q5KLEm1LoV7bVyQSERSHkkpkm0eMn
         jMxQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=FOnDCaFk;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HG9JQK6wVSOPMPtmQ+YWgrlL7WV5NMBZ/S/6dcyIcc8=;
        b=SbR96RJ2uYOg1MhaT3sKdNfrjzlAekfY9GIBe16mqI3cKpkoF7SAMMAFai20bsAQM5
         uuYsea29NeDvw+NpdhRiEaS3c57XxdK7Z4XCvsBqQOkXjZAGEZ4q/ayN49bdgYfsOsd0
         cTLVGlbRMU3ytr0VTHl0I3sKb++2NGSE24KU4a83JbXc5dccGpm7V7WDCxNZ0EVni06n
         U92a/0+o9vWyCoI1VVE2j3WJ4cwxrI4dehulSliWn/iONASBZPKUnE1K/nk104nq40Qd
         0mTrnkIP2vGgK/EAys2jwFF4P52Dp1Gjm5WzeTttPALojniZo4dTtR0IOiNChwZl8/Ob
         +FSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HG9JQK6wVSOPMPtmQ+YWgrlL7WV5NMBZ/S/6dcyIcc8=;
        b=mhuy99MTEH8VwUUwcyt5MKLooPvDj9pYUdy4yXepLCMNp9sXyMg4PPRiJH8b3MlKa2
         BDAVVv+P6sIJMRzA1Yo/zQtwlhBg84nA/sDYYaKCSedAS4E/B/MY58coiLKjg7YWf7VV
         SJqofoUp6+nt+x/a4KqDMhJzLwhGJDWqnVrd7YmQxamLgqCMigkNRAJPDNuOIlLOiOo4
         Jo8fLk4uyc0BGUTfJu/fl0X6zGVGDvgqNmUB93Bzg5AnUlVAARZo5w6xNMclNYgJGmOY
         wncgmKE1eatSYC/Du5YaXxESVCLsmzZiiLyL0JfTaem7apnuDidroVwIsEFHRT/kwrMX
         DyNA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530+2+274N8GCZf3nGsFhV3jwlUmSS4YjWXcezcpd3Wx5lQW7iGp
	68Rl7AbFfiUBwrCOnfq4iIM=
X-Google-Smtp-Source: ABdhPJyeX2W8rlhSYYqj8S2CJfOg+48cIWtOsEpc8AA/FvdViNX15ySAKlctC8vMRxfxnsWxMJgCIg==
X-Received: by 2002:a05:6512:358b:: with SMTP id m11mr6146662lfr.179.1619853129751;
        Sat, 01 May 2021 00:12:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1025:: with SMTP id w5ls177085ljm.0.gmail; Sat, 01
 May 2021 00:12:08 -0700 (PDT)
X-Received: by 2002:a2e:3a16:: with SMTP id h22mr6141227lja.434.1619853128697;
        Sat, 01 May 2021 00:12:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619853128; cv=none;
        d=google.com; s=arc-20160816;
        b=CkmRKQiBsbXWlV05EIqbGj1B3FpNNCLj7YwSTW7e+US7o19oWD0FU4umB17H/RFwlD
         4kRFysEoCdm3MPTr1VlbIYJVoEqPegpkp3uyE7Qz9xyaxfbxRDsdyQpDD4vqAk8CarVG
         mQShfFGd6ZzTToCT1rZ1O36ui8RWf86UKsqNE93zkjj4J2ZUDm2bbA6M8JRzlWLZR34N
         hp9Hfsgu8Zg+YloeVNg7Yf/Dq9LoPvNICi2kAuL9O7DJqK5+DmSvsCAMRcYhJsecBn+J
         EBWHTS7ghJUp0+b7RLM+fTFT7cwCt5Eyx4JIWyyfBmjzRaFqKC4stg8tE1ygON1je6XO
         E+VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=2U9ObPXjIVKWUN9qAOOF7LCc0xIfX7Rz9X9LVygJ+Sg=;
        b=dh+C2IeMksCHlb7bKTrZn0yCrZzqSBaqj1KFPCr4Ikq8YlkXgnmHYEl7tiSZb7Gorf
         rcPJvTibd+QEGgNTMG3SQDcNwdKIdcOuda1TMtmBs4qHD5gKQtcamEVed4RtjzzOkEsY
         v4oohNaHzKQGTDlvQMJF2m7Kf/qxIqarV/Q2GCeyDkT0LXE6r7+gnWmDPEc2fthbNtQb
         BRxZVhcJnNfoQttQkMp0bAGfTrOnzXtNqAtI2YZiqX8eWJJ53nX8zPcqgf7ga7c1Hdxg
         hFm+GMVdTjI/J068Tj4uqxrEfWS64xo8PAy1VmhuMTcjtAMdVz4qyIqdTtmwublj1uoZ
         TlZA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=FOnDCaFk;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id q13si533017lfm.5.2021.05.01.00.12.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 00:12:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.53]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Lp6xk-1l6gIn0mv6-00evnf; Sat, 01
 May 2021 09:12:01 +0200
Subject: Re: HELP about Jailhouse
To: =?UTF-8?B?5pu55a6P6bmP?= <caohp19@lzu.edu.cn>,
 jailhouse-dev@googlegroups.com
References: <3f44dbbd.3c81.17920bc1642.Coremail.caohp19@lzu.edu.cn>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <02875c49-2429-e452-9d25-90363743d8fc@web.de>
Date: Sat, 1 May 2021 09:11:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <3f44dbbd.3c81.17920bc1642.Coremail.caohp19@lzu.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jM7smUaK+9nDqXoa/F/owdWkUPMucOEmqzy2nBmkuNKKspJ3aIP
 MjA7a7nkW4kwUey762/iy0+VsGiVriD2aYVVbLNJBQAqpHGQ3NE5y/3ZDuzNqf78z+bykio
 3826havqAkplwxLjuZGjS/7bdZ4xn4YKYL4bZgutOvGrznZUfjdezzmsDxI2Nk/FpPznkTO
 HvWgewiUnkL4rYThoWXnA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:R7U2RvkU92k=:/hpWvhPvKBJ8Q4IBiZOESx
 hqfG8qd51DKE/VrKlXEckGZawQ4uLBi5XRVFmOXE73g3NBsGwS8/YnUI2u+r4WeXtb971Tzwh
 29a5AMKHukUW6wSW5Zb0nU4tPZifGGPOKKXiMqB4tfzpbRGypQbAiL72lpukNqIDrJtLUrDSz
 8CK5YPoOk/2Hv5vm45B5IE92avZ28Ce+nBxrITmqkcgndbdcvweCwPwb52mpdn08j9xLEcFQ+
 vyoHfUEPfhXmarjiFxLAsmxdkdSutHdGJoYdPPo7dwcfe6Zs3vdrXkCn/GjEiCpP+DZPpViOq
 f7AxwOVOLYQqiyUK1CTs5EULWEv4u3RL/WbLqouaXhPyj6moEa0iuj6B65JTxLyotvA7BTnN0
 eIE6fDZ/IbLZyH4IqDyiZneUelwdy76HXyevMAZ1Q/yQ+2qPt2LYvsAXwV2aGrlamom7wcTyX
 aVGv7CVNPGNKCul7dPTViGVCMtDCuO88Yd89dRQvJ8yLgpGwnWT+rab3URtZHz4XE4xziQg7r
 x85bV04qkYq1v6uMs+ovnSCSARTNrtWzXamlrTHR/CZlhI35VW+u+nqDHFF4DMDtFuiOW65sg
 krfnwz/We79WFNpZGCnqvqErO68jcsZudVBhypdJUk6mcI25PARugNwTpENUMN49C529Jd20/
 3a945+C0qfyRwwI1wcY8coWKcM29PfY62URpWlbZiCRAc6s4x56gqACyXuGJdCmMaMpsdJG8e
 L6WX9xPGkZUrxL1NX3/zGm3D4dYUQ/QTlc9RbrKgsT3zeQCFH2ed0VVB7GaGU7xIm4p4Tas+e
 3NO9pdBJESc+o/fYGRjpUL7B1IyrLH7MYe32zem22SBgmelvbKBKnGHaPiliqQDRmxLtwR/u6
 PKnjq1VCIICWqP/YJholCZiWLWWiW1kX9QlyqHDy7YKqdb6qC86XraZ0JGVjs+Ef+vYkSf+L/
 PIQQIMs9HEqgLNYUTfoNk9wRPYwUBO/5WiNscoS3cWBon+/EKiKhUZe8nPKd+cFJ3PCttYoUX
 cdIpLSKQyX+J8WeekBLsIY6UPehYEEtu2tnVETTkSReVN0/kTawFEoIC7kRxWyXdxJdPWsTUi
 kznfDL/PV7UXK9n8bokEaTH4Ic+M2lkyy66mfLGSUsAIZOFQbNd4BWjxWAflW+tXMcvZJPFRq
 tgJgWjMEGaAsF3fsE7SkixAGGue1cTw1RRcEkJVMc4NS3vx5uKUAVMzHbIQ6yS0ZpsNyU=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=FOnDCaFk;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

On 30.04.21 05:04, =E6=9B=B9=E5=AE=8F=E9=B9=8F wrote:
> Dear sir,
> &gt; Dear sir,
> &gt; Last year, I used the rapi-linux-demo.cell to launch a second cell o=
n my Raspberry Pi 4 model B. And the memory size of second cell was about 1=
84M.
> &gt; However, that is not enough to me to execute some test on it. So I t=
ry to change the size of the cell in the rpi-linux-demo.c, but it failed (m=
aybe occupied
> &gt;  other's memory, I don't know). A good news is, someone fixed this p=
roblem. The demo can provide 1G memory size=EF=BC=8C and I git clone the ne=
w project.
> &gt;
> &gt; BUT when I executed the operations same with before, I can not build=
 the jailhouse
> &gt;
> &gt; my operations is:
> &gt; 1. git clone https://github.com/siemens/jailhouse.git
> &gt; 2. sudo make &amp;&amp; make modules_install &amp;&amp; make install
> &gt; 3. sudo insmod driver/jailhouse.ko
> &gt; 4. sudo jailhouse enable configs/arm64/rpi4.cell
> &gt;
> &gt; The 4th step is failed, the error is:
> &gt; JAILHOUSE_ENABLE: Invalid argument
> &gt;
> &gt; I don't know why it occurs. Because there are two project on my Rasp=
berry (one is new, the other is cloned in last year ), the old one can run =
properly.
> &gt; If I can get your generous help, I will appreciate.
> &gt;
>
> First of all, thanks for Jan give me advice. I accept his advice and obta=
in some information.
> (NOTE: I just used the new project and I never changed the configs/arm64/=
rpi4.c)
> when I execute
> jailhouse enable rpi4.c
> the error is
>  JAILHOUSE_ENABLE: Invalid argument
> and then I see some information from the putty
> jailhouse:request_mem_region failed for hypervisor memory

This means that the hypervisor memory region configured in rpi4.cell
does not match a memory reservation done via the device tree. It likely
overlaps RAM that is in use by Linux, thus can't be taken by the hypervisor=
.

If you move the hypervisor memory region, make sure to adjust
https://github.com/siemens/jailhouse-images/blob/master/recipes-bsp/rpi-fir=
mware/files/debian/jailhouse.dts
as well.

Jan

> I don't know whether this error caused or not. Because I can run successf=
ully using old project and it also warn this problem. And I execute the fol=
lowed command
> sudo jailhouse config check configs/arm64/rpi4.cell
> the message is:
>
> Reading configuration set:
>   Root cell:     Raspberry-Pi4 (configs/arm64/rpi4.cell)
> Overlapping memory regions inside cell: None
> Overlapping memory regions with hypervisor: None
> Missing PCI MMCONFIG interceptions: None
> Missing resource interceptions for architecture arm64: None
>
> So what should I do ? If I can get your generous help , I will appreciate=
.
>
> Yours,
> Hongpeng Cao.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/02875c49-2429-e452-9d25-90363743d8fc%40web.de.
