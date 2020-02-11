Return-Path: <jailhouse-dev+bncBCQ7HUU4XULBBDVKRTZAKGQEVXKV3VA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x240.google.com (mail-oi1-x240.google.com [IPv6:2607:f8b0:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id C2288159ACE
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Feb 2020 21:56:47 +0100 (CET)
Received: by mail-oi1-x240.google.com with SMTP id 21sf6683365oiy.15
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Feb 2020 12:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=N2YE77ypmfGDNLiHs5w31nX6FQI/2oCw+SjnNgfK73Q=;
        b=PIYIsM1njb+M79Ntk+QITHjWgGRLBy69bn6dZvS8iOWTASgmFXr/aHlpUbPSlOfZL3
         h8CmBRSTP0+fAIaoutqVZUdCSg0O4r4/vkknGnw+sJED8rEmKJhB9YYiWDqvzrBbOPhl
         AIntgPoCfdAbeVfpvpEoQ3fiNqLTPrb/LiQjFuL3aUlQiM2o8c6qHf8qC5uWUfYVpXjZ
         nngvN/kf2ygpITMxsRLQQuYNUQ3MZyHhU0anYXoj8w3uiyKobGrIDII78tFMJX+1oKzn
         fEmlFSbBu5LxkEu/LGgMilx/eNXoJlMMlVAPpORFBC1KqZY11w4tQm0OL8l8qMdGCexD
         x93Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=N2YE77ypmfGDNLiHs5w31nX6FQI/2oCw+SjnNgfK73Q=;
        b=YRQBeU+ts8XGdgQ1sLCb76i7S4gezWMlOdsxIin+ZfhQqoQuMqLbldH0O8SKeexvNp
         kX3u84OiwvWHF/VqXYS8GVCPvv9m1gEU7UlAkA7Ww/6rwlMQfFRdEFiovCGv70BJ9FVk
         BpbrY3lvUSe3zFJPtf1v0rNBuoPoQ/0W63cSSsatySsVQlh1HPXpbPcVnhaqe20dIKfi
         QIQFTQ9a0aVf58cevulp/xV8iVQtDkoaRPgAsvdGGT5q83DIpvsDqBpHkNRUPLO8jTjI
         pTon8Lu09Zp4YY581jMFGUlCAowEUT6BnFpr/CVt6poewuFHRagmFSQGIq9QdxscorQ2
         gcLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=N2YE77ypmfGDNLiHs5w31nX6FQI/2oCw+SjnNgfK73Q=;
        b=G1WX1T6kmjfiwz98/hhIVqRvVoi6MLHQaeScqIxZJ8Bt6NqJbNxQ7i5p/DjoJCd9YM
         H0g7Ahy83T/2dQav5AIppqtzIvomA9TtMTc3mAAYQdLGXpNOh43dl+/gYjoxigY8cFF2
         aGKemF01rldPGWPmHoyz08mb1DKfSj3EFNGBR/IvCpZAM1CJJZkCR//h7BmWDk5cRmR2
         YSPD7MssZMNjkJfBpnje4A0rDqn2NPk5CT8zUswOUGP4tEHOSYcADH2CXFOsTMfF00dD
         +E4t3KbBme9bDitXnMZoVP4Pyd4kq35jlUthBiMthjJQyChK0jO9iN6ss6BTTYrrx8Gq
         SMnQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVL3oy6AA5XxBJTd51nl687JO3297e+0tu/zXZguFXQ1NIhGjaY
	aSTzW7bhYb2CN6oVlaexhH4=
X-Google-Smtp-Source: APXvYqzIn2zg9UwNDda5xqIx2D5InEP8ViXvD3gH5V5348J8uXtXLFTxlkMuGatZoWpmCMCMqiza6g==
X-Received: by 2002:a54:4011:: with SMTP id x17mr3954919oie.35.1581454606675;
        Tue, 11 Feb 2020 12:56:46 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:3e15:: with SMTP id a21ls3812983otd.8.gmail; Tue, 11 Feb
 2020 12:56:45 -0800 (PST)
X-Received: by 2002:a9d:24c8:: with SMTP id z66mr6888994ota.52.1581454605485;
        Tue, 11 Feb 2020 12:56:45 -0800 (PST)
Date: Tue, 11 Feb 2020 12:56:44 -0800 (PST)
From: Saroj Sapkota <samirroj2016@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <7cf1060e-2b4f-4d3f-a57e-a3079a4ef460@googlegroups.com>
In-Reply-To: <c6de1284-fa93-cb9c-44b2-552f851a5470@web.de>
References: <3b1a5cb0-d89a-4f0e-aa59-88e4f48999a8@googlegroups.com>
 <c6de1284-fa93-cb9c-44b2-552f851a5470@web.de>
Subject: Re: jailhouse compilation error (no include path)
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1968_1875456425.1581454604948"
X-Original-Sender: samirroj2016@gmail.com
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

------=_Part_1968_1875456425.1581454604948
Content-Type: multipart/alternative; 
	boundary="----=_Part_1969_163158724.1581454604949"

------=_Part_1969_163158724.1581454604949
Content-Type: text/plain; charset="UTF-8"

Thank you Jan, for the continuous support and encouragement 

I also tried in upstream kernel v4.9-tegra and  got the same error.

Furthermore, I also try to cross compile on x86 host(different machine) 
one  with v4.4, and other with v5.0.1 all of them results in the same error.

So whats the issue here I get really frustrated as same error pops up 
everywhere.


On Saturday, February 8, 2020 at 3:10:12 AM UTC-6, Jan Kiszka wrote:
>
> On 07.02.20 23:55, Saroj Sapkota wrote: 
> > While trying to built on jailhouse(master version) on jetson tx2 board I 
> > get the following  error: 
> > kernel version-4.9--tegra 
> > nvidia@jetson-0320218169735:~/jailhouse$ sudo make: 
> >   CHK      /home/nvidia/jailhouse/hypervisor/include/generated/config.mk 
> >    UPD     /home/nvidia/jailhouse/hypervisor/include/generated/config.mk 
> >   CC      /home/nvidia/jailhouse/configs/arm64/amd-seattle-inmate-demo.o 
> >    OBJCOPY 
> /home/nvidia/jailhouse/configs/arm64/amd-seattle-inmate-demo.cell 
> >    CC      /home/nvidia/jailhouse/configs/arm64/amd-seattle-linux-demo.o 
> >    OBJCOPY 
> /home/nvidia/jailhouse/configs/arm64/amd-seattle-linux-demo.cell 
> >    CC      /home/nvidia/jailhouse/configs/arm64/amd-seattle.o 
> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/amd-seattle.cell 
> >    CC      
> /home/nvidia/jailhouse/configs/arm64/espressobin-inmate-demo.o 
> >    OBJCOPY 
> /home/nvidia/jailhouse/configs/arm64/espressobin-inmate-demo.cell 
> >    CC      /home/nvidia/jailhouse/configs/arm64/espressobin-linux-demo.o 
> >    OBJCOPY 
> /home/nvidia/jailhouse/configs/arm64/espressobin-linux-demo.cell 
> >    CC      /home/nvidia/jailhouse/configs/arm64/espressobin.o 
> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/espressobin.cell 
> >    CC      
> /home/nvidia/jailhouse/configs/arm64/foundation-v8-inmate-demo.o 
> >    OBJCOPY 
> > /home/nvidia/jailhouse/configs/arm64/foundation-v8-inmate-demo.cell 
> >    CC      
> /home/nvidia/jailhouse/configs/arm64/foundation-v8-linux-demo.o 
> >    OBJCOPY 
> > /home/nvidia/jailhouse/configs/arm64/foundation-v8-linux-demo.cell 
> >    CC      /home/nvidia/jailhouse/configs/arm64/foundation-v8.o 
> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/foundation-v8.cell 
> >    CC      /home/nvidia/jailhouse/configs/arm64/hikey-inmate-demo.o 
> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/hikey-inmate-demo.cell 
> >    CC      /home/nvidia/jailhouse/configs/arm64/hikey-linux-demo.o 
> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/hikey-linux-demo.cell 
> >    CC      /home/nvidia/jailhouse/configs/arm64/hikey.o 
> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/hikey.cell 
> >    CC      /home/nvidia/jailhouse/configs/arm64/imx8mq-inmate-demo.o 
> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/imx8mq-inmate-demo.cell 
> >    CC      /home/nvidia/jailhouse/configs/arm64/imx8mq.o 
> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/imx8mq.cell 
> >    CC      /home/nvidia/jailhouse/configs/arm64/jetson-tx1-inmate-demo.o 
> >    OBJCOPY 
> /home/nvidia/jailhouse/configs/arm64/jetson-tx1-inmate-demo.cell 
> >    CC      /home/nvidia/jailhouse/configs/arm64/jetson-tx1-linux-demo.o 
> >    OBJCOPY 
> /home/nvidia/jailhouse/configs/arm64/jetson-tx1-linux-demo.cell 
> >    CC      /home/nvidia/jailhouse/configs/arm64/jetson-tx1.o 
> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/jetson-tx1.cell 
> >    CC      /home/nvidia/jailhouse/configs/arm64/jetson-tx2-inmate-demo.o 
> >    OBJCOPY 
> /home/nvidia/jailhouse/configs/arm64/jetson-tx2-inmate-demo.cell 
> >    CC      /home/nvidia/jailhouse/configs/arm64/jetson-tx2.o 
> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/jetson-tx2.cell 
> >    CC      
> /home/nvidia/jailhouse/configs/arm64/k3-am654-idk-linux-demo.o 
> >    OBJCOPY 
> /home/nvidia/jailhouse/configs/arm64/k3-am654-idk-linux-demo.cell 
> >    CC      /home/nvidia/jailhouse/configs/arm64/k3-am654-idk.o 
> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/k3-am654-idk.cell 
> >    CC      /home/nvidia/jailhouse/configs/arm64/k3-am654-inmate-demo.o 
> >    OBJCOPY 
> /home/nvidia/jailhouse/configs/arm64/k3-am654-inmate-demo.cell 
> >    CC      
> /home/nvidia/jailhouse/configs/arm64/k3-j721e-evm-inmate-demo.o 
> >    OBJCOPY 
> > /home/nvidia/jailhouse/configs/arm64/k3-j721e-evm-inmate-demo.cell 
> >    CC      
> /home/nvidia/jailhouse/configs/arm64/k3-j721e-evm-linux-demo.o 
> >    OBJCOPY 
> /home/nvidia/jailhouse/configs/arm64/k3-j721e-evm-linux-demo.cell 
> >    CC      /home/nvidia/jailhouse/configs/arm64/k3-j721e-evm.o 
> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/k3-j721e-evm.cell 
> >    CC      
> /home/nvidia/jailhouse/configs/arm64/macchiatobin-inmate-demo.o 
> >    OBJCOPY 
> > /home/nvidia/jailhouse/configs/arm64/macchiatobin-inmate-demo.cell 
> >    CC      
> /home/nvidia/jailhouse/configs/arm64/macchiatobin-linux-demo.o 
> >    OBJCOPY 
> /home/nvidia/jailhouse/configs/arm64/macchiatobin-linux-demo.cell 
> >    CC      /home/nvidia/jailhouse/configs/arm64/macchiatobin.o 
> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/macchiatobin.cell 
> >    CC 
> > /home/nvidia/jailhouse/configs/arm64/miriac-sbc-ls1046a-inmate-demo.o 
> >    OBJCOPY 
> > /home/nvidia/jailhouse/configs/arm64/miriac-sbc-ls1046a-inmate-demo.cell 
> >    CC 
> > /home/nvidia/jailhouse/configs/arm64/miriac-sbc-ls1046a-linux-demo.o 
> >    OBJCOPY 
> > /home/nvidia/jailhouse/configs/arm64/miriac-sbc-ls1046a-linux-demo.cell 
> >    CC      /home/nvidia/jailhouse/configs/arm64/miriac-sbc-ls1046a.o 
> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/miriac-sbc-ls1046a.cell 
> >    CC      /home/nvidia/jailhouse/configs/arm64/qemu-arm64-inmate-demo.o 
> >    OBJCOPY 
> /home/nvidia/jailhouse/configs/arm64/qemu-arm64-inmate-demo.cell 
> >    CC      /home/nvidia/jailhouse/configs/arm64/qemu-arm64-linux-demo.o 
> >    OBJCOPY 
> /home/nvidia/jailhouse/configs/arm64/qemu-arm64-linux-demo.cell 
> >    CC      /home/nvidia/jailhouse/configs/arm64/qemu-arm64.o 
> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/qemu-arm64.cell 
> >    CC      /home/nvidia/jailhouse/configs/arm64/rpi4-inmate-demo.o 
> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/rpi4-inmate-demo.cell 
> >    CC      /home/nvidia/jailhouse/configs/arm64/rpi4-linux-demo.o 
> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/rpi4-linux-demo.cell 
> >    CC      /home/nvidia/jailhouse/configs/arm64/rpi4.o 
> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/rpi4.cell 
> >    CC      /home/nvidia/jailhouse/configs/arm64/ultra96-inmate-demo.o 
> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/ultra96-inmate-demo.cell 
> >    CC      /home/nvidia/jailhouse/configs/arm64/ultra96-linux-demo.o 
> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/ultra96-linux-demo.cell 
> >    CC      /home/nvidia/jailhouse/configs/arm64/ultra96.o 
> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/ultra96.cell 
> >    CC      
> /home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102-inmate-demo.o 
> >    OBJCOPY 
> > /home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102-inmate-demo.cell 
> >    CC      
> /home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102-linux-demo-2.o 
> >    OBJCOPY 
> > /home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102-linux-demo-2.cell 
> >    CC      
> /home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102-linux-demo.o 
> >    OBJCOPY 
> > /home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102-linux-demo.cell 
> >    CC      /home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102.o 
> >    OBJCOPY /home/nvidia/jailhouse/configs/arm64/zynqmp-zcu102.cell 
> >    DTC     
> /home/nvidia/jailhouse/configs/arm64/dts/inmate-amd-seattle.dtb 
> > 
> > /home/nvidia/jailhouse/configs/arm64/dts/inmate-amd-seattle.dts:17:54: 
> > error: no include path in which to search for 
> > dt-bindings/interrupt-controller/arm-gic.h 
> > scripts/Makefile.lib:291: recipe for target 
> > '/home/nvidia/jailhouse/configs/arm64/dts/inmate-amd-seattle.dtb' failed 
> > make[3]: *** 
> > [/home/nvidia/jailhouse/configs/arm64/dts/inmate-amd-seattle.dtb] Error 
> 1 
> > scripts/Makefile.build:479: recipe for target 
> > '/home/nvidia/jailhouse/configs' failed 
> > make[2]: *** [/home/nvidia/jailhouse/configs] Error 2 
> > Makefile:1429: recipe for target '_module_/home/nvidia/jailhouse' failed 
> > make[1]: *** [_module_/home/nvidia/jailhouse] Error 2 
> > Makefile:40: recipe for target 'modules' failed 
> > make: *** [modules] Error 2 
> > I also tried it cross compiling in host machine and I got the same 
> > error. (i also tried cross compiling in different x86 machine one with 
> > kernel-4.4 (ubuntu 16.04) and another with kernel-5.01(ubuntu 18.04) but 
> > same error as above pops up) 
>
> Then it is likely an issue with that downstream NVIDIA kernel. Jailhouse 
> builds fine against upstream v4.9.213 (although that is surely no longer 
> a recommended version for it). Maybe NVIDIA fixed that in newer versions 
> of their SDK. 
>
> Jan 
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7cf1060e-2b4f-4d3f-a57e-a3079a4ef460%40googlegroups.com.

------=_Part_1969_163158724.1581454604949
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thank you Jan, for the continuous support and encoura=
gement <br></div><div><br></div><div>I also tried in upstream kernel v4.9-t=
egra and=C2=A0 got the same error.</div><div><br></div><div>Furthermore, I =
also try to cross compile on x86 host(different machine) one=C2=A0 with v4.=
4, and other with v5.0.1 all of them results in the same error.</div><div><=
br></div><div>So whats the issue here I get really frustrated as same error=
 pops up everywhere.<br></div><div><br></div><br>On Saturday, February 8, 2=
020 at 3:10:12 AM UTC-6, Jan Kiszka wrote:<blockquote class=3D"gmail_quote"=
 style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;padding-=
left: 1ex;">On 07.02.20 23:55, Saroj Sapkota wrote:
<br>&gt; While trying to built on jailhouse(master version) on jetson tx2 b=
oard I
<br>&gt; get the following=C2=A0 error:
<br>&gt; kernel version-4.9--tegra
<br>&gt; nvidia@jetson-0320218169735:~/<wbr>jailhouse$ sudo make:
<br>&gt; =C2=A0=C2=A0CHK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>hypervisor/include/generated/<a href=3D"http://config.mk" target=3D=
"_blank" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;http://www.google=
.com/url?q\x3dhttp%3A%2F%2Fconfig.mk\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQj=
CNGEkyWeHjQy_OtIczpEwGPYYo_epg&#39;;return true;" onclick=3D"this.href=3D&#=
39;http://www.google.com/url?q\x3dhttp%3A%2F%2Fconfig.mk\x26sa\x3dD\x26sntz=
\x3d1\x26usg\x3dAFQjCNGEkyWeHjQy_OtIczpEwGPYYo_epg&#39;;return true;">c<wbr=
>onfig.mk</a>
<br>&gt; =C2=A0=C2=A0 UPD=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/<w=
br>hypervisor/include/generated/<a href=3D"http://config.mk" target=3D"_bla=
nk" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;http://www.google.com/=
url?q\x3dhttp%3A%2F%2Fconfig.mk\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNGEk=
yWeHjQy_OtIczpEwGPYYo_epg&#39;;return true;" onclick=3D"this.href=3D&#39;ht=
tp://www.google.com/url?q\x3dhttp%3A%2F%2Fconfig.mk\x26sa\x3dD\x26sntz\x3d1=
\x26usg\x3dAFQjCNGEkyWeHjQy_OtIczpEwGPYYo_epg&#39;;return true;">c<wbr>onfi=
g.mk</a>
<br>&gt; =C2=A0=C2=A0CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhous=
e/<wbr>configs/arm64/amd-seattle-<wbr>inmate-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/<wbr>configs/arm64/amd=
-seattle-<wbr>inmate-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/amd-seattle-<wbr>linux-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/<wbr>configs/arm64/amd=
-seattle-<wbr>linux-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/amd-seattle.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/<wbr>configs/arm64/amd=
-seattle.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/espressobin-<wbr>inmate-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/<wbr>configs/arm64/esp=
ressobin-<wbr>inmate-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/espressobin-<wbr>linux-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/<wbr>configs/arm64/esp=
ressobin-<wbr>linux-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/espressobin.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/<wbr>configs/arm64/esp=
ressobin.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/foundation-v8-<wbr>inmate-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY
<br>&gt; /home/nvidia/jailhouse/<wbr>configs/arm64/foundation-v8-<wbr>inmat=
e-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/foundation-v8-<wbr>linux-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY
<br>&gt; /home/nvidia/jailhouse/<wbr>configs/arm64/foundation-v8-<wbr>linux=
-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/foundation-v8.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/<wbr>configs/arm64/fou=
ndation-v8.<wbr>cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/hikey-inmate-<wbr>demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/<wbr>configs/arm64/hik=
ey-inmate-<wbr>demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/hikey-linux-<wbr>demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/<wbr>configs/arm64/hik=
ey-linux-<wbr>demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/hikey.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/<wbr>configs/arm64/hik=
ey.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/imx8mq-inmate-<wbr>demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/<wbr>configs/arm64/imx=
8mq-inmate-<wbr>demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/imx8mq.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/<wbr>configs/arm64/imx=
8mq.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/jetson-tx1-<wbr>inmate-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/<wbr>configs/arm64/jet=
son-tx1-<wbr>inmate-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/jetson-tx1-<wbr>linux-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/<wbr>configs/arm64/jet=
son-tx1-<wbr>linux-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/jetson-tx1.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/<wbr>configs/arm64/jet=
son-tx1.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/jetson-tx2-<wbr>inmate-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/<wbr>configs/arm64/jet=
son-tx2-<wbr>inmate-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/jetson-tx2.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/<wbr>configs/arm64/jet=
son-tx2.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/k3-am654-idk-<wbr>linux-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/<wbr>configs/arm64/k3-=
am654-idk-<wbr>linux-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/k3-am654-idk.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/<wbr>configs/arm64/k3-=
am654-idk.<wbr>cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/k3-am654-inmate-<wbr>demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/<wbr>configs/arm64/k3-=
am654-inmate-<wbr>demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/k3-j721e-evm-<wbr>inmate-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY
<br>&gt; /home/nvidia/jailhouse/<wbr>configs/arm64/k3-j721e-evm-<wbr>inmate=
-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/k3-j721e-evm-<wbr>linux-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/<wbr>configs/arm64/k3-=
j721e-evm-<wbr>linux-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/k3-j721e-evm.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/<wbr>configs/arm64/k3-=
j721e-evm.<wbr>cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/macchiatobin-<wbr>inmate-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY
<br>&gt; /home/nvidia/jailhouse/<wbr>configs/arm64/macchiatobin-<wbr>inmate=
-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/macchiatobin-<wbr>linux-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/<wbr>configs/arm64/mac=
chiatobin-<wbr>linux-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/macchiatobin.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/<wbr>configs/arm64/mac=
chiatobin.<wbr>cell
<br>&gt; =C2=A0=C2=A0 CC
<br>&gt; /home/nvidia/jailhouse/<wbr>configs/arm64/miriac-sbc-<wbr>ls1046a-=
inmate-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY
<br>&gt; /home/nvidia/jailhouse/<wbr>configs/arm64/miriac-sbc-<wbr>ls1046a-=
inmate-demo.cell
<br>&gt; =C2=A0=C2=A0 CC
<br>&gt; /home/nvidia/jailhouse/<wbr>configs/arm64/miriac-sbc-<wbr>ls1046a-=
linux-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY
<br>&gt; /home/nvidia/jailhouse/<wbr>configs/arm64/miriac-sbc-<wbr>ls1046a-=
linux-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/miriac-sbc-<wbr>ls1046a.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/<wbr>configs/arm64/mir=
iac-sbc-<wbr>ls1046a.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/qemu-arm64-<wbr>inmate-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/<wbr>configs/arm64/qem=
u-arm64-<wbr>inmate-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/qemu-arm64-<wbr>linux-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/<wbr>configs/arm64/qem=
u-arm64-<wbr>linux-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/qemu-arm64.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/<wbr>configs/arm64/qem=
u-arm64.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/rpi4-inmate-<wbr>demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/<wbr>configs/arm64/rpi=
4-inmate-<wbr>demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/rpi4-linux-demo.<wbr>o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/<wbr>configs/arm64/rpi=
4-linux-demo.<wbr>cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/rpi4.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/<wbr>configs/arm64/rpi=
4.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/ultra96-inmate-<wbr>demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/<wbr>configs/arm64/ult=
ra96-inmate-<wbr>demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/ultra96-linux-<wbr>demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/<wbr>configs/arm64/ult=
ra96-linux-<wbr>demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/ultra96.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/<wbr>configs/arm64/ult=
ra96.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/zynqmp-zcu102-<wbr>inmate-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY
<br>&gt; /home/nvidia/jailhouse/<wbr>configs/arm64/zynqmp-zcu102-<wbr>inmat=
e-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/zynqmp-zcu102-<wbr>linux-demo-2.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY
<br>&gt; /home/nvidia/jailhouse/<wbr>configs/arm64/zynqmp-zcu102-<wbr>linux=
-demo-2.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/zynqmp-zcu102-<wbr>linux-demo.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY
<br>&gt; /home/nvidia/jailhouse/<wbr>configs/arm64/zynqmp-zcu102-<wbr>linux=
-demo.cell
<br>&gt; =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhou=
se/<wbr>configs/arm64/zynqmp-zcu102.o
<br>&gt; =C2=A0=C2=A0 OBJCOPY /home/nvidia/jailhouse/<wbr>configs/arm64/zyn=
qmp-zcu102.<wbr>cell
<br>&gt; =C2=A0=C2=A0 DTC=C2=A0=C2=A0=C2=A0=C2=A0 /home/nvidia/jailhouse/<w=
br>configs/arm64/dts/inmate-amd-<wbr>seattle.dtb
<br>&gt;
<br>&gt; /home/nvidia/jailhouse/<wbr>configs/arm64/dts/inmate-amd-<wbr>seat=
tle.dts:17:54:
<br>&gt; error: no include path in which to search for
<br>&gt; dt-bindings/interrupt-<wbr>controller/arm-gic.h
<br>&gt; scripts/Makefile.lib:291: recipe for target
<br>&gt; &#39;/home/nvidia/jailhouse/<wbr>configs/arm64/dts/inmate-amd-<wbr=
>seattle.dtb&#39; failed
<br>&gt; make[3]: ***
<br>&gt; [/home/nvidia/jailhouse/<wbr>configs/arm64/dts/inmate-amd-<wbr>sea=
ttle.dtb] Error 1
<br>&gt; scripts/Makefile.build:479: recipe for target
<br>&gt; &#39;/home/nvidia/jailhouse/<wbr>configs&#39; failed
<br>&gt; make[2]: *** [/home/nvidia/jailhouse/<wbr>configs] Error 2
<br>&gt; Makefile:1429: recipe for target &#39;_module_/home/nvidia/<wbr>ja=
ilhouse&#39; failed
<br>&gt; make[1]: *** [_module_/home/nvidia/<wbr>jailhouse] Error 2
<br>&gt; Makefile:40: recipe for target &#39;modules&#39; failed
<br>&gt; make: *** [modules] Error 2
<br>&gt; I also tried it cross compiling in host machine and I got the same
<br>&gt; error. (i also tried cross compiling in different x86 machine one =
with
<br>&gt; kernel-4.4 (ubuntu 16.04) and another with kernel-5.01(ubuntu 18.0=
4) but
<br>&gt; same error as above pops up)
<br>
<br>Then it is likely an issue with that downstream NVIDIA kernel. Jailhous=
e
<br>builds fine against upstream v4.9.213 (although that is surely no longe=
r
<br>a recommended version for it). Maybe NVIDIA fixed that in newer version=
s
<br>of their SDK.
<br>
<br>Jan
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/7cf1060e-2b4f-4d3f-a57e-a3079a4ef460%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/7cf1060e-2b4f-4d3f-a57e-a3079a4ef460%40googlegroups.com<=
/a>.<br />

------=_Part_1969_163158724.1581454604949--

------=_Part_1968_1875456425.1581454604948--
