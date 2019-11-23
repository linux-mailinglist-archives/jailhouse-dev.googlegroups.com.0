Return-Path: <jailhouse-dev+bncBDGPNAOTTIGBBAET4XXAKGQEFKIZVKY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3C5107EF5
	for <lists+jailhouse-dev@lfdr.de>; Sat, 23 Nov 2019 16:00:17 +0100 (CET)
Received: by mail-wr1-x439.google.com with SMTP id f8sf329463wrw.21
        for <lists+jailhouse-dev@lfdr.de>; Sat, 23 Nov 2019 07:00:17 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1574521217; cv=pass;
        d=google.com; s=arc-20160816;
        b=MCsFrGoU5l3RcXxxYbAQHuFecb2VKFVb858b/7bWd0bJrpAXWGrdtuFrJbEQHie3us
         63v1fQNIuwXG1TUa5ik94o3EqTmLzLCKA9fUApt3f0yvqPY/9tLPWXuRGWQC6GLA0St+
         rPp6uce/m9zpo1TBIyL9o02jUMkViZJeZVey2OKGquEeQS7lDNolD6Z0HyfNBcXVQL4t
         CmZjb59OoaudD/rrCmHZ4bQzxQ9BnNZyDb4szjnJTGfXZVJzgzz4W3p9pUwxQ13+3rT/
         cyV+NXMgrw9Rwc3wYJr3OY7VIj9n6/sZEyAUbpkcsBZ3IM4FHowsEkVtVgx7gdABtMb7
         uFmg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:importance:date:subject:from:to
         :mime-version:message-id:sender:dkim-signature:dkim-signature;
        bh=k4g56EkbZUSngGQdfgjmj0pxyo5D0cxO/E+OpFtE+ak=;
        b=MzmHJxVCQj2cUOB+KJdJ8I7KkhkFTU9/tghQAAs2RMMsR4pkd92mf4k2yw8sjOl8yu
         PcuatNnVrXjkxgQalHLSuuG1aCBU4FxVxWSFdQuC68brhIRnOTNvHL6/IfdBN0I63Nr+
         76jNCMsXcAsUx+KRt4haSQlEU+32OkrquIRSi54bmUqP1ZcAiVhRi1QGbx09MlkFmd0P
         ei8vb+PX/0yEY9V7/JZJDqoQbNrLA8Ljfcfu9PTSCL0sYP5dnODRjw32NkifkXTZShD5
         XPrwOVOcGcyPaurqWZshHbAn0xCIMd/wYNT1MXgM6mcwIwiPh6jw36ONLXp5bovf2ayv
         oKZw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=oEsMn7ae;
       spf=pass (google.com: domain of feusscix@gmail.com designates 2a00:1450:4864:20::432 as permitted sender) smtp.mailfrom=feusscix@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:message-id:mime-version:to:from:subject:date:importance
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=k4g56EkbZUSngGQdfgjmj0pxyo5D0cxO/E+OpFtE+ak=;
        b=CZc7mWV5Hjuc3/057OvsjO4OZnEXgPzDYZxPgaEStg0VAHTPCNyU+0VOrP1GrhZXCX
         7rIZvz3am6vWSnNbZyKHHc0+ZEZPk5Ssn8Tymt4gLd84M5cUu1l3UdGDfztmg86Tu2l7
         VfBKxrDlxqhRs6F4vVwqNNAZGjjmSwGULxdtkX70PWBWI/qyF22hUItUHyhRolwmdqia
         yjJjJOI4e5cY+xksUfVbfu0sKQOIB2akGZAJnEo1s02eoxZELX+TNQR3rOYvaOuXL9NM
         dIq5T+PF/O7lj+5tJ6n6iVxu+pjG2jYUXgbSsSqjqcg63CjpOL+2mhp65wh3sQrnia6B
         L4jw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:mime-version:to:from:subject:date:importance
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=k4g56EkbZUSngGQdfgjmj0pxyo5D0cxO/E+OpFtE+ak=;
        b=gdQVJsrlCL1kouescKj14Kq77gsWwo3LEpzJazh1nwcg3KRo/S0pXONs46NESIbcS1
         jsO8fL8dOT3vNcx9B36TcT6IJwEFJq22IZFwaWCJFf/DbU51ut2UfEmDsiRT1Pq+HXWQ
         SDQB/X6nBjNIwp4bSgR21OC072qbmdkgZubOyvHw0BgU2ulJ2hv5lEQGPYXCqy2o4HjL
         FZY7tyu3IpTMp3yRxRqMQtYuILzdKJ9yXIhLRj5zGBTjDem1kplPiPD/KA9LLC5JcMOK
         XQZBC+uxgBaDTl1NR2332SHSPx6bIPTcmVUnS177AJKVllrs9/oNwLMEuAp5S9KNxCAl
         OhdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:message-id:mime-version:to:from:subject
         :date:importance:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=k4g56EkbZUSngGQdfgjmj0pxyo5D0cxO/E+OpFtE+ak=;
        b=QKpXPUXpiFN07f80oK/Hp0Tw2tu4hHYX/j7zb/8+GCSdVt0aR2roC6u6BYzOcS99Ww
         AsUmLesTLCjTFpfOiSsfOgSXBf2n4lf0P4MoU36ZmfSSt5lKFd5hyHE1NDSz68kfPiA0
         DAr3gS7mXcS5K5MebBpE36nunPwl72rVeJsedwC07JtX2eLBUexsUBXSd/XKgSC9j9ws
         FCf+f70x8q/V79dFqDuxwhSPwyBU7928OzOdbsqmFBYzFXYxU4X+2Krvj9Ni4ocbivG1
         YismE2kupA+tS16z5j6aI8pSXYorA/ZEmQASfvtBftFBJv0TJPLxLjK0XsXoL5Vb2Nhu
         SwTQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUz1slBVKe5qNZF/GlhrOPBJG9Cb/ZP55gyV3RSA3I4gshAAaK6
	wSIXz4bc+TAssM14cdx1z3g=
X-Google-Smtp-Source: APXvYqyXUOZm1YRYHrVZRaY4BxTBQXEriH5Qd6xSesbUGghCVd4fpCz57kfvEtQ+czZ2nzBD/sqFmQ==
X-Received: by 2002:adf:f64b:: with SMTP id x11mr1562513wrp.355.1574521217209;
        Sat, 23 Nov 2019 07:00:17 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:960a:: with SMTP id y10ls6469033wmd.0.gmail; Sat, 23 Nov
 2019 07:00:16 -0800 (PST)
X-Received: by 2002:a05:600c:cb:: with SMTP id u11mr21054686wmm.5.1574521216378;
        Sat, 23 Nov 2019 07:00:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574521216; cv=none;
        d=google.com; s=arc-20160816;
        b=LUEnM13camy0hnuirt2MjcHOrBKwuWn7r4HSSYol1oY2g8TtadA1U1PD3JTLXIfayM
         zPvvi0D8dnj7erLB3TN5P9rGkMw1A7dwZLijXLQHfdbl7oAfvmZfxCno2PsbGtIhkca7
         i27xbwo/e1Ya8m0NNHPpCblbQWo+6tHVHwX+XLeIiaUYpiB+vEMgvNPpE9I6GsCE0iPW
         Ws5uyTwOQ25wg4wO1U4YHfzh4l+003o/HZuvl5OoK8d5W6cUOv2mA91bEG7cRyYWXIA0
         d5V/2QJWxmKMg/UBsVoyLjEs2oiFzndF6gPwqEJcNBjsX2CXpHvt1aSVYeRl3dEGs6HX
         Yy+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=importance:date:subject:from:to:mime-version:message-id
         :dkim-signature;
        bh=Bg09Iub1jysv3gnzRR75wWHX+nk3GPPJxeYoG5xFG98=;
        b=J551dS7isNuOYgQxH7zEFqvQh0BjK/e/RwH1bcEPhzXn6e645VbnyNFmH1KzrHYwGh
         b8vIqAWfGiabzym5rKOiUojmsI2y3aRmi/DzFFCXgz2WogwHWQL/VYQykVsq7zSrtYKV
         VZCkyLytz0ZouyL1GY7DTSU1UIQvnKeKSsezNmOOP459ZQvUekJ1ZMSQcw2xM2bmvbXh
         BSLBx0joE8y8/xaIzTmRw13orO/k6u8KS3MBaMHqjgVpql7/zF3prnal8WeBNP8F3Bjs
         6zlYDC4dgNotH23dS+Zww3IhA9OLTy2QyqtmqEJ+hEV3RqEuPkvo1+XVLpjLmWYcaB1o
         AbLQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=oEsMn7ae;
       spf=pass (google.com: domain of feusscix@gmail.com designates 2a00:1450:4864:20::432 as permitted sender) smtp.mailfrom=feusscix@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com. [2a00:1450:4864:20::432])
        by gmr-mx.google.com with ESMTPS id u23si39410wml.2.2019.11.23.07.00.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Nov 2019 07:00:16 -0800 (PST)
Received-SPF: pass (google.com: domain of feusscix@gmail.com designates 2a00:1450:4864:20::432 as permitted sender) client-ip=2a00:1450:4864:20::432;
Received: by mail-wr1-x432.google.com with SMTP id t2so12172595wrr.1
        for <jailhouse-dev@googlegroups.com>; Sat, 23 Nov 2019 07:00:16 -0800 (PST)
X-Received: by 2002:adf:ed11:: with SMTP id a17mr23573834wro.392.1574521215774;
        Sat, 23 Nov 2019 07:00:15 -0800 (PST)
Received: from ?IPv6:2a02:8071:b6a5:8e00:6cfa:40e3:7d97:e0a2? ([2a02:8071:b6a5:8e00:6cfa:40e3:7d97:e0a2])
        by smtp.gmail.com with ESMTPSA id b10sm2456360wrw.53.2019.11.23.07.00.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 23 Nov 2019 07:00:15 -0800 (PST)
Message-ID: <5dd9497f.1c69fb81.47354.a05c@mx.google.com>
MIME-Version: 1.0
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
From: Felix Schwer <feusscix@gmail.com>
Subject: inmate freezes when accessing GPIOs on imx8mm
Date: Sat, 23 Nov 2019 16:00:15 +0100
Importance: normal
X-Priority: 3
Content-Type: multipart/alternative;
	boundary="_FA235541-AABD-449A-8178-A956C136F97E_"
X-Original-Sender: feusscix@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=oEsMn7ae;       spf=pass
 (google.com: domain of feusscix@gmail.com designates 2a00:1450:4864:20::432
 as permitted sender) smtp.mailfrom=feusscix@gmail.com;       dmarc=pass
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

--_FA235541-AABD-449A-8178-A956C136F97E_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"


Hello everybody,

I'm currently trying to extend the IVSHMEM demo for imx8mm (https://source.=
codeaurora.org/external/imx/imx-jailhouse/tree/configs/arm64?h=3Dimx_4.14.7=
8_1.0.0_ga) to allow for access to GPIO banks.=20
I added the corresponding memory regions in the cell config=E2=80=A6
/* gpio3 */ {=20
.phys_start =3D 0x30220000,=20
.virt_start =3D 0x30220000,=20
.size =3D 0x10000,=20
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |=20
JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
},=20
/* gpio5 */ {=20
.phys_start =3D 0x30240000,=20
.virt_start =3D 0x30240000,=20
.size =3D 0x10000,=20
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |=20
JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,=20
},
=E2=80=A6
I also removed this memory sections from the root cell config:
=E2=80=A6
/* IO */ {=20
.phys_start =3D 0x00000000,=20
.virt_start =3D 0x00000000,=20
.size =3D 0x30220000,=20
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |=20
JAILHOUSE_MEM_IO,=20
},=20
/* IO */ {=20
.phys_start =3D 0x30250000,=20
.virt_start =3D 0x30250000,=20
.size =3D 0x0FDB0000,=20
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |=20
JAILHOUSE_MEM_IO,=20
},
=E2=80=A6
Also, I disabled the corresponding GPIOS in the fsl-imx8mm-evk-root.dts And=
 reserved the memory sections.=20
=E2=80=A6
&gpio3 {=20
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Disable gpio3 */=20
=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D "disabled";=20
};=20

&gpio5 {=20
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Disable gpio5*/=20
=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D "disabled";=20
};=20

&{/reserved-memory} {=20

=C2=A0 =C2=A0 =C2=A0 =C2=A0 gpio3_reserved: gpio@0x30220000 {=20
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 no-map;=20
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D <0 0x302200=
00 0x0 0x10000>;=20
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };=20
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gpio5_reserved: gpio@0x30240000 {=20
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 no-map;=20
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D <0 0x302400=
00 0x0 0x10000>;=20
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };
=E2=80=A6
The cell boots correctly and the inmate is starting and running.
Accessing the GPIOs via the gpiochips in Linux worked (before removing them=
 from the .dts)

When I access the memory via mmio_write32(=E2=80=A6) =E2=80=A6

mmio_write32(((void *)(unsigned long)(0x30240000)),0xFFFFFFFF);

or mmio_read32(=E2=80=A6) in the inmate freezes without any message.

Am I missing out on something? Are there any specialties or other configura=
tions I have to consider when accessing GPIOs from the cell side?

Thanks for your help!

Felix


--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/5dd9497f.1c69fb81.47354.a05c%40mx.google.com.

--_FA235541-AABD-449A-8178-A956C136F97E_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="UTF-8"

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta ht=
tp-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta name=
=3DGenerator content=3D"Microsoft Word 15 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 2.0cm 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style></head><body lang=3DDE link=3Dblue vlink=3D"#954F72"><div class=
=3DWordSection1><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNor=
mal><span lang=3DEN-US>Hello everybody,<o:p></o:p></span></p><p class=3DMso=
Normal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal>=
<span lang=3DEN-US>I'm currently trying to extend the IVSHMEM demo for imx8=
mm (</span><a href=3D"https://source.codeaurora.org/external/imx/imx-jailho=
use/tree/configs/arm64?h=3Dimx_4.14.98_2.2.0"><span style=3D'color:windowte=
xt;text-decoration:none'><u><span style=3D'color:blue'>https://source.codea=
urora.org/external/imx/imx-jailhouse/tree/configs/arm64?h=3Dimx_4.14.78_1.0=
.0_ga</span></u></span></a><span lang=3DEN-US>) to allow for access to GPIO=
 banks. <o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>I add=
ed the corresponding memory regions in the cell config=E2=80=A6<o:p></o:p><=
/span></p><p class=3DMsoNormal><span lang=3DEN-US style=3D'font-size:10.0pt=
;font-family:"Courier New";color:#3F8080'>/* gpio3 */</span><span lang=3DEN=
-US style=3D'font-size:10.0pt;font-family:"Courier New"'> {</span><span lan=
g=3DEN-US> <o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US st=
yle=3D'font-size:10.0pt;font-family:"Courier New"'>.phys_start =3D 0x302200=
00,</span><span lang=3DEN-US> <o:p></o:p></span></p><p class=3DMsoNormal><s=
pan lang=3DEN-US style=3D'font-size:10.0pt;font-family:"Courier New"'>.virt=
_start =3D 0x30220000,</span><span lang=3DEN-US> <o:p></o:p></span></p><p c=
lass=3DMsoNormal><span lang=3DEN-US style=3D'font-size:10.0pt;font-family:"=
Courier New"'>.size =3D 0x10000,</span><span lang=3DEN-US> <o:p></o:p></spa=
n></p><p class=3DMsoNormal><span lang=3DEN-US style=3D'font-size:10.0pt;fon=
t-family:"Courier New"'>.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE=
 |</span><span lang=3DEN-US> <br></span><span lang=3DEN-US style=3D'font-si=
ze:10.0pt;font-family:"Courier New"'>JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32=
,</span><span lang=3DEN-US><o:p></o:p></span></p><p class=3DMsoNormal><span=
 lang=3DEN-US style=3D'font-size:10.0pt;font-family:"Courier New"'>},</span=
><span lang=3DEN-US> <br></span><span lang=3DEN-US style=3D'font-size:10.0p=
t;font-family:"Courier New";color:#3F8080'>/* gpio5 */</span><span lang=3DE=
N-US style=3D'font-size:10.0pt;font-family:"Courier New"'> {</span><span la=
ng=3DEN-US> <o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US s=
tyle=3D'font-size:10.0pt;font-family:"Courier New"'>.phys_start =3D 0x30240=
000,</span><span lang=3DEN-US> <o:p></o:p></span></p><p class=3DMsoNormal><=
span lang=3DEN-US style=3D'font-size:10.0pt;font-family:"Courier New"'>.vir=
t_start =3D 0x30240000,</span><span lang=3DEN-US> <o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US style=3D'font-size:10.0pt;font-family:=
"Courier New"'>.size =3D 0x10000,</span><span lang=3DEN-US> <o:p></o:p></sp=
an></p><p class=3DMsoNormal><span lang=3DEN-US style=3D'font-size:10.0pt;fo=
nt-family:"Courier New"'>.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRIT=
E |</span><span lang=3DEN-US> <br></span><span lang=3DEN-US style=3D'font-s=
ize:10.0pt;font-family:"Courier New"'>JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_3=
2,</span><span lang=3DEN-US> <o:p></o:p></span></p><p class=3DMsoNormal><sp=
an lang=3DEN-US style=3D'font-size:10.0pt;font-family:"Courier New"'>},</sp=
an><span lang=3DEN-US><o:p></o:p></span></p><p class=3DMsoNormal><span lang=
=3DEN-US>=E2=80=A6<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DE=
N-US>I also removed this memory sections from the root cell config:<o:p></o=
:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>=E2=80=A6<o:p></o:p><=
/span></p><p class=3DMsoNormal><span lang=3DEN-US style=3D'font-size:10.0pt=
;font-family:"Courier New"'>/* IO */ { <o:p></o:p></span></p><p class=3DMso=
Normal><span lang=3DEN-US style=3D'font-size:10.0pt;font-family:"Courier Ne=
w"'>.phys_start =3D 0x00000000, <o:p></o:p></span></p><p class=3DMsoNormal>=
<span lang=3DEN-US style=3D'font-size:10.0pt;font-family:"Courier New"'>.vi=
rt_start =3D 0x00000000, <o:p></o:p></span></p><p class=3DMsoNormal><span l=
ang=3DEN-US style=3D'font-size:10.0pt;font-family:"Courier New"'>.size =3D =
0x30220000, <o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US s=
tyle=3D'font-size:10.0pt;font-family:"Courier New"'>.flags =3D JAILHOUSE_ME=
M_READ | JAILHOUSE_MEM_WRITE | <br>JAILHOUSE_MEM_IO, <o:p></o:p></span></p>=
<p class=3DMsoNormal><span lang=3DEN-US style=3D'font-size:10.0pt;font-fami=
ly:"Courier New"'>}, <o:p></o:p></span></p><p class=3DMsoNormal><span lang=
=3DEN-US style=3D'font-size:10.0pt;font-family:"Courier New"'>/* IO */ { <o=
:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US style=3D'font-s=
ize:10.0pt;font-family:"Courier New"'>.phys_start =3D 0x30250000, <o:p></o:=
p></span></p><p class=3DMsoNormal><span lang=3DEN-US style=3D'font-size:10.=
0pt;font-family:"Courier New"'>.virt_start =3D 0x30250000, <o:p></o:p></spa=
n></p><p class=3DMsoNormal><span lang=3DEN-US style=3D'font-size:10.0pt;fon=
t-family:"Courier New"'>.size =3D 0x0FDB0000, <o:p></o:p></span></p><p clas=
s=3DMsoNormal><span lang=3DEN-US style=3D'font-size:10.0pt;font-family:"Cou=
rier New"'>.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | <br>JAILHO=
USE_MEM_IO, <o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US s=
tyle=3D'font-size:10.0pt;font-family:"Courier New"'>},<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-US style=3D'font-size:10.0pt;font-fam=
ily:"Courier New"'>=E2=80=A6<o:p></o:p></span></p><p class=3DMsoNormal><spa=
n lang=3DEN-US>Also, I disabled the corresponding GPIOS in the fsl-imx8mm-e=
vk-root.dts And reserved the memory sections. <o:p></o:p></span></p><p clas=
s=3DMsoNormal><span lang=3DEN-US>=E2=80=A6<o:p></o:p></span></p><p class=3D=
MsoNormal><span lang=3DEN-US style=3D'font-size:10.0pt;font-family:"Arial",=
sans-serif'>&amp;gpio3 {</span><span lang=3DEN-US> <br></span><span lang=3D=
EN-US style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>&nbsp; &nbs=
p; &nbsp; &nbsp; /* Disable gpio3 */</span><span lang=3DEN-US> <br></span><=
span lang=3DEN-US style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'=
>&nbsp; &nbsp; &nbsp; &nbsp; status =3D &quot;disabled&quot;;</span><span l=
ang=3DEN-US> <br></span><span lang=3DEN-US style=3D'font-size:10.0pt;font-f=
amily:"Arial",sans-serif'>};</span><span lang=3DEN-US> <br><br></span><span=
 lang=3DEN-US style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>&am=
p;gpio5 {</span><span lang=3DEN-US> <br></span><span lang=3DEN-US style=3D'=
font-size:10.0pt;font-family:"Arial",sans-serif'>&nbsp; &nbsp; &nbsp; &nbsp=
; /* Disable gpio5*/</span><span lang=3DEN-US> <br></span><span lang=3DEN-U=
S style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>&nbsp; &nbsp; &=
nbsp; &nbsp; status =3D &quot;disabled&quot;;</span><span lang=3DEN-US> <br=
></span><span lang=3DEN-US style=3D'font-size:10.0pt;font-family:"Arial",sa=
ns-serif'>};</span><span lang=3DEN-US> <br><br></span><span lang=3DEN-US st=
yle=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>&amp;{/reserved-mem=
ory} {</span><span lang=3DEN-US> <br><br></span><span lang=3DEN-US style=3D=
'font-size:10.0pt;font-family:"Arial",sans-serif'>&nbsp; &nbsp; &nbsp; &nbs=
p; gpio3_reserved: gpio@0x30220000 {</span><span lang=3DEN-US> <br></span><=
span lang=3DEN-US style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'=
>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; no-map;</span><spa=
n lang=3DEN-US> <br></span><span lang=3DEN-US style=3D'font-size:10.0pt;fon=
t-family:"Arial",sans-serif'>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; reg =3D &lt;0 0x30220000 0x0 0x10000&gt;;</span><span lang=3DEN-U=
S> <br></span><span lang=3DEN-US style=3D'font-size:10.0pt;font-family:"Ari=
al",sans-serif'>&nbsp; &nbsp; &nbsp; &nbsp; };</span><span lang=3DEN-US> <b=
r></span><span lang=3DEN-US style=3D'font-size:10.0pt;font-family:"Arial",s=
ans-serif'>&nbsp; &nbsp; &nbsp; &nbsp; gpio5_reserved: gpio@0x30240000 {</s=
pan><span lang=3DEN-US> <br></span><span lang=3DEN-US style=3D'font-size:10=
.0pt;font-family:"Arial",sans-serif'>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; no-map;</span><span lang=3DEN-US> <br></span><span lang=
=3DEN-US style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>&nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; reg =3D &lt;0 0x30240000 0x=
0 0x10000&gt;;</span><span lang=3DEN-US> <br></span><span lang=3DEN-US styl=
e=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>&nbsp; &nbsp; &nbsp; =
&nbsp; };<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US styl=
e=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>=E2=80=A6</span><span=
 lang=3DEN-US><o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US=
>The cell boots correctly and the inmate is starting and running.<o:p></o:p=
></span></p><p class=3DMsoNormal><span lang=3DEN-US>Accessing the GPIOs via=
 the gpiochips in Linux worked (before removing them from the .dts)<o:p></o=
:p></span></p><p class=3DMsoNormal><span lang=3DEN-US><br>When I access the=
 memory via mmio_write32(=E2=80=A6) =E2=80=A6<o:p></o:p></span></p><p class=
=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoN=
ormal><span lang=3DEN-US style=3D'font-size:10.0pt;font-family:"Courier New=
"'>mmio_write32(((<b><span style=3D'color:#820040'>void</span></b> *)(<b><s=
pan style=3D'color:#820040'>unsigned</span></b> <b><span style=3D'color:#82=
0040'>long</span></b>)(0x30240000)),0xFFFFFFFF);<br><br></span><span lang=
=3DEN-US><o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>or m=
mio_read32(=E2=80=A6) in the inmate freezes without any message.<o:p></o:p>=
</span></p><p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-US>Am I missing out on something? =
Are there any specialties or other configurations I have to consider when a=
ccessing GPIOs from the cell side?<br><br>Thanks for your help!<br><br>Feli=
x<br><br><o:p></o:p></span></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p></=
div></body></html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/5dd9497f.1c69fb81.47354.a05c%40mx.google.com?utm_m=
edium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailho=
use-dev/5dd9497f.1c69fb81.47354.a05c%40mx.google.com</a>.<br />

--_FA235541-AABD-449A-8178-A956C136F97E_--

