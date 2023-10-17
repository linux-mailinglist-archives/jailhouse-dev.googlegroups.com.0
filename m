Return-Path: <jailhouse-dev+bncBDM2HMO5Q4HBBU4MXKUQMGQEDBABF4I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id EC00B7CC3E7
	for <lists+jailhouse-dev@lfdr.de>; Tue, 17 Oct 2023 15:04:21 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id 2adb3069b0e04-507b9078aaasf1328900e87.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 17 Oct 2023 06:04:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1697547861; cv=pass;
        d=google.com; s=arc-20160816;
        b=xOX5BvItZkSdbJNehhQIN2FNUZElHbqF2OsyWtPZnxgFTbx0HTzRBDV7/Fi/lkEGU7
         kt/Jh755goMIrruhLJP4YpeZHcb9tw4FJZG4MkgcMCZSGKaglUjfEMUb2yEBI71woBGT
         5KGjer7/DcVDUtnVCQJfLR3T5R2fqucd70jy8KTuv2poeDWU3lhQotBPez7pBDrMeJ7C
         EOTZsfTQFXZOUL0uWWsvDca3b6XvCmrtY+xElfYTnEmTbPjEi++DLGj4vn39kxAn2Cg/
         QxCIzJ9A+PbHU4TCOQtnSfmGBa8tlape9jU38S/2tydP3R8cPXPEl98BtZd+aU6fOcwP
         x/MA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=l2emUbxMPERqsnYer7p8JwLwnrvB02LpbsBYnBaJQ/g=;
        fh=2tQzQ7BDCTqJm82PDY7f/SoNACc8xWmtm+Icohy5zLg=;
        b=J6zGSGOmzXa/p9FBGFKeRKNaRb17rF0DDxCccXiwBofI0jDG9IvMXNO/0vRktgGLJz
         V+qftBem+uk2wwXx74DAXb6Z7n4tlHmIABx95XdDZrGSV+Ydy08Z+BWXA9LjSKkLMy1T
         WCvvR1+8N5KaFxPeCRvEtB25nbuJm/OCJZrlBTav46A5eNceBinCeDCrFTLZKAOQlDnW
         pWy5xQQRTOrYoFdfHHp9wFECcWvUMgcdFY8m63x+ntUUXDIgFrHkIKuq3io9eWTcr44G
         CKI8hnnkzyKiqFIoiVDGHJ6izwbPW+/CdiUKGcshkDC9tvz7+O9HioIwY+PgHZmleVhB
         6gTg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@marples.net header.s=mail header.b=RkiYrO1L;
       spf=neutral (google.com: 2a00:1450:4864:20::133 is neither permitted nor denied by domain of dave@marples.net) smtp.mailfrom=dave@marples.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1697547861; x=1698152661; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=l2emUbxMPERqsnYer7p8JwLwnrvB02LpbsBYnBaJQ/g=;
        b=nHzYm6G67sAfR5MyQVDR5zWcNOIbaioR2NcyZ5faULr8I7H23qzTXNtbPA5HDqpCVL
         48yFhvvsysSa4CgP1bKLh04HR/KivpqLnSgntVkE7bGtwrV58k/ZBWdj7pgKZmQLrFf6
         1PCgMEHLSGmv0NyK76TCkqQUVRRU5+Q7ikYLSQkwW88F1GIyupVJ/QzGb6yMmLKhpOxt
         P/WZ56sYspNCa4kT0Iwo7yWqQNDP3tUuuQLzSZeUusZ7RGuwOxomi0UFHvAzA68PBTjb
         YE0lm0SPfXzZ/VW+N0hRICBGDMRMnHUhHlrVZslMgm6Jc3e71VYui+yBYkv+IvYJmlDg
         gLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697547861; x=1698152661;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2emUbxMPERqsnYer7p8JwLwnrvB02LpbsBYnBaJQ/g=;
        b=oqjCDr1WB/Nj+uyU36S2KoreQNCV1Kd4Av3mcoUoh/kIUwNVABsDRPDRwLLf/9ZpDo
         HXTEcBFjISblZsFp9hrIJ+uhXczs+EDHDod40qaVzZimj2G9YnFeUzP27fTHPQ+uGdcx
         wwT+6YGSOpvexyb/HljC3Ms/yPj7ura5lEOQ+ORcub4HC+OPXU+pFipDPQVWZij/T9NL
         Fl9VVMH6mRFnI49p4AOuJaHG7ecEMosfUx/7x50XMp41ghW1iavsV//eXXIXStPrc+bC
         F0cFCUtcAWYbIL2VSJGOb8KdkjI6ODBQDwGi7z6Q1jmf+CT158aeDH3ojX6zDykG6HLZ
         tlhw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0Yx7/TFjGj0L0LDgAWPcTeClFjOUs65YwSbgU4G0Boz1b9Ffffeg
	9mZqvkNBeQHazTCKqxFjNQk=
X-Google-Smtp-Source: AGHT+IF1v46PnHIP0KbYY3tLsuUXHflX/GrBfgZJIfVR8lSNYf+sG87XUKZmt2XFXe8sV+613eGN/g==
X-Received: by 2002:ac2:4887:0:b0:507:9683:519f with SMTP id x7-20020ac24887000000b005079683519fmr1661322lfc.37.1697547860618;
        Tue, 17 Oct 2023 06:04:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:46da:0:b0:506:8b0b:f8bb with SMTP id p26-20020ac246da000000b005068b0bf8bbls18202lfo.0.-pod-prod-08-eu;
 Tue, 17 Oct 2023 06:04:18 -0700 (PDT)
X-Received: by 2002:a05:6512:2387:b0:503:8fa:da22 with SMTP id c7-20020a056512238700b0050308fada22mr2116002lfv.22.1697547858088;
        Tue, 17 Oct 2023 06:04:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697547858; cv=none;
        d=google.com; s=arc-20160816;
        b=bBBRa5JypQgyhSByWIaH1PArq9yST1PhoBAsVvyalUEmouKnsYvz+75B5lqENJesJl
         h6YQOhSV6QKz8vYtgtCpYyb7SDgeeV9tV1t+OZ2jpE4FQvjvbYKW8dyIL0AKlnsobcHp
         U4NJEiTN2jqp6i4hcj7kSbUmTJIg56I4C0sf2KZm/m8Hg5MdqcVSyP8kPPrrWNzQfnqo
         qxOcnHS8ACqf/syjMZIMZiZ0jDI3GhwJZrTUsbXteeLHVGY8N8hn6Tmd8gDAn5RHXUow
         DJbVoLPelGbvfcjB8XF5yXQeyZ6idvC322w52FWo6whGd+x1hUSyUsEuCUzEkaZxgbKn
         5gRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=BIUzvs+CY59h7gjB8fpgql7EBVJDXv56EGpSmXsngUQ=;
        fh=2tQzQ7BDCTqJm82PDY7f/SoNACc8xWmtm+Icohy5zLg=;
        b=J8qP38iNZY7Y/tvAnlPqcsAkZS0UMVe1nj2FZMGYu683b/e7D24d6oik2U9RiHRY24
         f52VZMbGeMr6LnB7K6Dj+Yhu00Ey8TwZS/TdskuluTEzmheRgCyFbiR8B5XuaVbbf+Mq
         pFzYMluaNkHWugl/j1E+mIh5R4w00m6OjdP7iKK9ItBmfXJdYBp9ZwqQEqbkWAQfYDNZ
         u5mFdzF8CRtlJNluihRbKWgoKP/y6vP/kXtRRDVmqyRrPyyZNNoTrHPGEJiFt1t+DZLl
         zs654mdA10uOKSj7W5C2zK3aDaBuhlophRUX/wuUnp1YmfjEcqoszz4auXdZyBSJNNrM
         Xs/A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@marples.net header.s=mail header.b=RkiYrO1L;
       spf=neutral (google.com: 2a00:1450:4864:20::133 is neither permitted nor denied by domain of dave@marples.net) smtp.mailfrom=dave@marples.net
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com. [2a00:1450:4864:20::133])
        by gmr-mx.google.com with ESMTPS id b22-20020a0565120b9600b005032919f892si54604lfv.6.2023.10.17.06.04.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 06:04:17 -0700 (PDT)
Received-SPF: neutral (google.com: 2a00:1450:4864:20::133 is neither permitted nor denied by domain of dave@marples.net) client-ip=2a00:1450:4864:20::133;
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-507adc3381cso3122070e87.3
        for <jailhouse-dev@googlegroups.com>; Tue, 17 Oct 2023 06:04:17 -0700 (PDT)
X-Received: by 2002:a05:6512:3b28:b0:500:b872:7899 with SMTP id f40-20020a0565123b2800b00500b8727899mr2353854lfv.62.1697547857159;
        Tue, 17 Oct 2023 06:04:17 -0700 (PDT)
Received: from [192.168.0.250] (cpc143270-mfl21-2-0-cust976.13-1.cable.virginm.net. [86.28.243.209])
        by smtp.gmail.com with ESMTPSA id b4-20020a05600c4e0400b004030e8ff964sm9811914wmq.34.2023.10.17.06.04.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 06:04:16 -0700 (PDT)
Message-ID: <4b8c293a-de5d-4ede-ab38-c42294ba3554@marples.net>
Date: Tue, 17 Oct 2023 14:04:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Can't install jailhouse on linux-6.1 arm system
Content-Language: en-US
To: jailhouse-dev@googlegroups.com
References: <5a564454-0a20-4c44-93c2-67e30025c8a6n@googlegroups.com>
From: Dave Marples <dave@marples.net>
In-Reply-To: <5a564454-0a20-4c44-93c2-67e30025c8a6n@googlegroups.com>
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: dave@marples.net
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@marples.net header.s=mail header.b=RkiYrO1L;       spf=neutral
 (google.com: 2a00:1450:4864:20::133 is neither permitted nor denied by domain
 of dave@marples.net) smtp.mailfrom=dave@marples.net
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

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 17/10/2023 09:48, Dave Marples
      wrote:</div>
    <blockquote type=3D"cite"
      cite=3D"mid:5a564454-0a20-4c44-93c2-67e30025c8a6n@googlegroups.com">
      <div>I'm building jailhouse on a arm64 linux 6.1 Debian bookworm
        system (imx8m, if it matters) using gcc 12.2.0...or, more
        specfically, failing to build. I get to the module install stage
        and then get;</div>
      <div><br>
      </div>
      <div><font face=3D"Courier New"><br>
        </font></div>
      <div><font face=3D"Courier New">ERROR: modpost: "__hyp_stub_vectors"
          [/root/jailhouse/driver/jailhouse.ko] undefined!<br>
          ERROR: modpost: "ioremap_page_range"
          [/root/jailhouse/driver/jailhouse.ko] undefined!<br>
          ERROR: modpost: "__get_vm_area_caller"
          [/root/jailhouse/driver/jailhouse.ko] undefined!<br>
          make[2]: *** [scripts/Makefile.modpost:126:
          /root/jailhouse/Module.symvers] Error 1<br>
          make[1]: *** [Makefile:1989: modpost] Error 2<br>
          make: *** [Makefile:40: modules] Error 2</font><br>
      </div>
      <div><br>
      </div>
      <div><br>
      </div>
      <div>So far as I can tell I have all of the required KALLSYMS set,
        so wondered if anyone else had trouble with recent kernels or if
        I'm missing some magic somewhere?</div>
    </blockquote>
    <p>Just to start the follow-up on this in case it's useful to anyone
      else in future; I figured out that I'd missed the stage of
      patching the kernel ( It might make sense to add a prod for this
      in the 'Build &amp; Installation' instructions ... ) using the
      patch embedded in gen-kernel-build.sh and adjusting to suit my
      kernel..is there somewhere else I'm supposed to get that patch
      from in a cleaner way?</p>
    <p>I'm now at the point where the thing will start, but pretty
      quickly falls over in a big heap;</p>
    <p><font face=3D"Courier New"># jailhouse enable imx8mm.cell <br>
        [=C2=A0=C2=A0 62.953888]=C2=A0 jailhouse: firmware: direct-loading =
firmware
        jailhouse.bin<br>
        [=C2=A0=C2=A0 62.961239] Unable to handle kernel execute from
        non-executable memory at virtual address ffff80000a004000<br>
        [=C2=A0=C2=A0 62.961239] Unable to handle kernel execute from
        non-executable memory at virtual address ffff80000a004000<br>
        [=C2=A0=C2=A0 62.961239] Unable to handle kernel execute from
        non-executable memory at virtual address ffff80000a004000<br>
        [=C2=A0=C2=A0 62.961239] Unable to handle kernel execute from
        non-executable memory at virtual address ffff80000a004000<br>
        [=C2=A0=C2=A0 62.961248] Mem abort info:<br>
        [=C2=A0=C2=A0 62.961248] Mem abort info:<br>
        [=C2=A0=C2=A0 62.961248] Mem abort info:<br>
        [=C2=A0=C2=A0 62.961249]=C2=A0=C2=A0 ESR =3D 0x000000008600000e<br>
        [=C2=A0=C2=A0 62.961250]=C2=A0=C2=A0 ESR =3D 0x000000008600000e</fo=
nt><br>
    </p>
    <p>Help still appreciated...Can't help getting the feeling I'm
      missing a document somewhere whereby all this lot magically
      becomes easy...<font face=3D"Courier New"><br>
      </font></p>
  </body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/4b8c293a-de5d-4ede-ab38-c42294ba3554%40marples.net=
?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/=
jailhouse-dev/4b8c293a-de5d-4ede-ab38-c42294ba3554%40marples.net</a>.<br />
