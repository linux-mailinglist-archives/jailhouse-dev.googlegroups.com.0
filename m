Return-Path: <jailhouse-dev+bncBCBJJVUE3MMRB4752GMQMGQERKJBFRI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3d.google.com (mail-qv1-xf3d.google.com [IPv6:2607:f8b0:4864:20::f3d])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC5D5EE28A
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Sep 2022 19:05:57 +0200 (CEST)
Received: by mail-qv1-xf3d.google.com with SMTP id g12-20020a0cfdcc000000b004ad431ceee0sf8159068qvs.7
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Sep 2022 10:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date;
        bh=ecanM1YbZ6ARyGY99Yd/mbb0N09dMzbvn+7wheQShMQ=;
        b=n9Ngt6rGqlpv+oZMI8uHh2VoJT8gANnLMT00O8E4bfOY1qp52u4EOTkirEftEZYekg
         1vgak5O9LKYucqDlOxaQU74U3ubqUmk9RYIRuYQUiZxofq8cSfVXiLcBXZXcE/jS9xvm
         vzQo8ZHwg/6hlwmAdrjlzpC2Sys1pK/IkDdX5ZJPnc3qqjqdMXXd+XeVUmDtiIr4hLYP
         6VscMblBfHGKVlUy6eFM/lWakaOCM1UPwDkDNgrdpQFuDkHTQmH/HmGoGJRy0Umv3bto
         SYU5Db35hUuaIq2LVS6Iic9lZU01nbEwZI6fxue+KJpmjnpUTTmYM19QkzGNmARj75+H
         Ghyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date;
        bh=ecanM1YbZ6ARyGY99Yd/mbb0N09dMzbvn+7wheQShMQ=;
        b=F8nXc5du73/9AHuLyqusZn2Cwgvb9FST7nIJYLtkPi+8E57RpEAhkrjv2m9gpDgBJ7
         Lvj/L8LaQ4jsVZRZ7fzPY2ONoCsWCWowlsw6nomYjlP372vFfEiRXzr1kZw5Xzcy1s0i
         pPdv+1iAV/FtJ1FQzOyOGOzjzL8+9Zt3ybC7NX1A8yu4WFOnd+bVWuidYkZYet9pVcJr
         Q2anpxEaEcjQAyZD9ofkVRhn5pbiKwnbEZzsxbeChgleQPWB4xO48QtGfKtA2laMtjCf
         2cO1l28zfGrUyyTj+Rswm8vxpUz5YNBQ9U/RA7Mhw6pbDztr1GiRFJ96AIISJJ5VV0oa
         qP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-gm-message-state:sender:from:to:cc
         :subject:date;
        bh=ecanM1YbZ6ARyGY99Yd/mbb0N09dMzbvn+7wheQShMQ=;
        b=4Dv1vIgjkJHkSgNlgJfFfjtNyov2frZ+Ef8Y+UqpN0um2XJfVODUY2aYZh0IFnw9xM
         VwfKBlFBh+AEI6iD/HKvorZ/6cW2nZELw/PNWvtgUGOVvmyKs2lcML0tzMN+Wr1SG6Rg
         eGerMp9kf9vW3DYshfNQq0x+dHx8uPgg331Iup6kC123DcAxtRFPvoq8t3vXRz5lwDm1
         rY0+zq3mMFoR8G3Tl0uL2JIiAuDmrKxkz3kjktvBZ4ktAxYexLG0e/s9BAf7zHmpOVi3
         hqbiBat+3X9llcJHifgkmWja6gt6Y5ChIl5P8ynW+lrDS+4nsnpPa2JjrGRLwxPgKSfs
         roUQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACrzQf0KZOz0oEg1trq1rNw9nq8vfQPtIH6TF27aXEiQBOIy+sJopuLt
	hx4NJZGhC5eBV0rJPZ75W/U=
X-Google-Smtp-Source: AMsMyM5JNe+8dJ8JXgFQkxadKzO7HWC8vnV0xNziAz726eIUyMzdttYVt04L1Y1xN8sRvGP0g7xzbg==
X-Received: by 2002:a05:6214:21ee:b0:4ac:7107:4c23 with SMTP id p14-20020a05621421ee00b004ac71074c23mr27109266qvj.86.1664384756221;
        Wed, 28 Sep 2022 10:05:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:8:b0:6cd:ef1b:e92a with SMTP id j8-20020a05620a000800b006cdef1be92als3870607qki.9.-pod-prod-gmail;
 Wed, 28 Sep 2022 10:05:55 -0700 (PDT)
X-Received: by 2002:a05:620a:2888:b0:6cf:5798:9a2d with SMTP id j8-20020a05620a288800b006cf57989a2dmr22452908qkp.508.1664384755332;
        Wed, 28 Sep 2022 10:05:55 -0700 (PDT)
Date: Wed, 28 Sep 2022 10:05:54 -0700 (PDT)
From: Yelena Konyukh <ykonyukh@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <aa2b89e1-18cf-4089-b793-1da11ae04b77n@googlegroups.com>
In-Reply-To: <CA+V-a8vEOGdMrNyJOo=ad3JLAe4joXmNnz+n_oJboW3rPdh8qA@mail.gmail.com>
References: <003480a3-4384-45f2-87c6-e7badb3ef40an@googlegroups.com>
 <CA+V-a8vEOGdMrNyJOo=ad3JLAe4joXmNnz+n_oJboW3rPdh8qA@mail.gmail.com>
Subject: Re: Linux inmate not receiving interrupts
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1278_1573404438.1664384754454"
X-Original-Sender: ykonyukh@gmail.com
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

------=_Part_1278_1573404438.1664384754454
Content-Type: multipart/alternative; 
	boundary="----=_Part_1279_2093585497.1664384754454"

------=_Part_1279_2093585497.1664384754454
Content-Type: text/plain; charset="UTF-8"

Hi Parbhakar,

Just to say that your messages have helped me again - I had exactly the 
same problem as you originally had.
Keep doing this great job of sharing your issues and their solutions, 
please :).

Thank you

Best Regards,
Yelena  

On Friday, June 10, 2022 at 2:55:51 PM UTC+1 prabhaka...@gmail.com wrote:

> Hi,
>
> On Mon, Jun 6, 2022 at 8:29 PM Prabhakar Lad <prabhaka...@gmail.com> 
> wrote:
> >
> > Hi,
> >
> > I have the below setup for Linux inmate:
> > * Use initramfs
> > * UART is enabled
> > * eMMC is enabled
> >
> > In the inmate cell I have the below:
> > .irqchips = {
> > /* GIC */ {
> > .address = 0xf1010000,
> > .pin_base = 128,
> > .pin_bitmap = {
> > 1 << (153+32 - 160), /* SCIF1 - SPI153 */
> > },
> > },
> > /* GIC */ {
> > .address = 0xf1010000,
> > .pin_base = 160,
> > .pin_bitmap = {
> > 1 << (168+32 - 192), /* SDHI3 - SPI168 */
> > },
> > },
> > },
> >
> > And in the inmate DTS I have the below:
> >
> > scif1: serial@e6e68000 {
> > compatible = "renesas,scif-r8a774a1",
> > "renesas,rcar-gen3-scif", "renesas,scif";
> > reg = <0 0xe6e68000 0 0x40>;
> > interrupt-parent = <&gic>;
> > interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
> > clocks = <&cpg CPG_MOD 206>,
> > <&cpg CPG_CORE R8A774A1_CLK_S3D1>,
> > <&scif_clk>;
> > clock-names = "fck", "brg_int", "scif_clk";
> > power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
> > resets = <&cpg 206>;
> > pinctrl-0 = <&scif1_pins>;
> > pinctrl-names = "default";
> > };
> >
> > gic: interrupt-controller@f1010000 {
> > compatible = "arm,gic-400";
> > #interrupt-cells = <3>;
> > #address-cells = <0>;
> > interrupt-controller;
> > reg = <0x0 0xf1010000 0 0x1000>,
> > <0x0 0xf102f000 0 0x20000>,
> > <0x0 0xf1040000 0 0x20000>,
> > <0x0 0xf106f000 0 0x20000>;
> > interrupts = <GIC_PPI 9
> > (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_HIGH)>;
> > };
> >
> > When Linux is started on the inmate cell, I can see its booting through 
> but it doesn't fall into shell.
> >
> > --- a/drivers/irqchip/irq-gic.c
> > +++ b/drivers/irqchip/irq-gic.c
> > @@ -341,6 +341,9 @@ static void __exception_irq_entry 
> gic_handle_irq(struct pt_regs *regs)
> > irqstat = readl_relaxed(cpu_base + GIC_CPU_INTACK);
> > irqnr = irqstat & GICC_IAR_INT_ID_MASK;
> >
> > + if (irqnr < 1020)
> > + pr_err(">>>>>>>>>>>>>>>>%s We received IRQ:%u<<<<<<<<<<<<<<\n", 
> __func__, irqnr);
> > +
> > if (unlikely(irqnr >= 1020))
> > break;
> >
> > I added the above and I can see the Linux inmate receives only 0/1/27 
> interrupts.
> >
> > Which gives me a feeling the Linux inmate isn't receiving the required 
> interrupts.
> >
> > Any pointers on where I should be looking into?
> >
> Ive fixed this by updating the GIC masks.
>
> Cheers,
> Prabhakar
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/aa2b89e1-18cf-4089-b793-1da11ae04b77n%40googlegroups.com.

------=_Part_1279_2093585497.1664384754454
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Parbhakar,<br><br>Just to say that your messages have helped me again - =
I had exactly the same problem as you originally had.<br>Keep doing this gr=
eat job of sharing your issues and their solutions, please :).<br><br>Thank=
 you<br><br>Best Regards,<br>Yelena&nbsp; <br><br><div class=3D"gmail_quote=
"><div dir=3D"auto" class=3D"gmail_attr">On Friday, June 10, 2022 at 2:55:5=
1 PM UTC+1 prabhaka...@gmail.com wrote:<br/></div><blockquote class=3D"gmai=
l_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204,=
 204); padding-left: 1ex;">Hi,
<br>
<br>On Mon, Jun 6, 2022 at 8:29 PM Prabhakar Lad &lt;<a href data-email-mas=
ked rel=3D"nofollow">prabhaka...@gmail.com</a>&gt; wrote:
<br>&gt;
<br>&gt; Hi,
<br>&gt;
<br>&gt; I have the below setup for Linux inmate:
<br>&gt; * Use initramfs
<br>&gt; * UART is enabled
<br>&gt; * eMMC is enabled
<br>&gt;
<br>&gt; In the inmate cell I have the below:
<br>&gt;     .irqchips =3D {
<br>&gt;         /* GIC */ {
<br>&gt;             .address =3D 0xf1010000,
<br>&gt;             .pin_base =3D 128,
<br>&gt;             .pin_bitmap =3D {
<br>&gt;                 1 &lt;&lt; (153+32 - 160), /* SCIF1 - SPI153 */
<br>&gt;             },
<br>&gt;         },
<br>&gt;         /* GIC */ {
<br>&gt;             .address =3D 0xf1010000,
<br>&gt;             .pin_base =3D 160,
<br>&gt;             .pin_bitmap =3D {
<br>&gt;                 1 &lt;&lt; (168+32 - 192), /* SDHI3 - SPI168 */
<br>&gt;             },
<br>&gt;         },
<br>&gt;     },
<br>&gt;
<br>&gt; And in the inmate DTS I have the below:
<br>&gt;
<br>&gt;         scif1: serial@e6e68000 {
<br>&gt;             compatible =3D &quot;renesas,scif-r8a774a1&quot;,
<br>&gt;                       &quot;renesas,rcar-gen3-scif&quot;, &quot;re=
nesas,scif&quot;;
<br>&gt;             reg =3D &lt;0 0xe6e68000 0 0x40&gt;;
<br>&gt;             interrupt-parent =3D &lt;&amp;gic&gt;;
<br>&gt;             interrupts =3D &lt;GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH&gt;=
;
<br>&gt;             clocks =3D &lt;&amp;cpg CPG_MOD 206&gt;,
<br>&gt;                  &lt;&amp;cpg CPG_CORE R8A774A1_CLK_S3D1&gt;,
<br>&gt;                  &lt;&amp;scif_clk&gt;;
<br>&gt;             clock-names =3D &quot;fck&quot;, &quot;brg_int&quot;, =
&quot;scif_clk&quot;;
<br>&gt;             power-domains =3D &lt;&amp;sysc R8A774A1_PD_ALWAYS_ON&=
gt;;
<br>&gt;             resets =3D &lt;&amp;cpg 206&gt;;
<br>&gt;             pinctrl-0 =3D &lt;&amp;scif1_pins&gt;;
<br>&gt;             pinctrl-names =3D &quot;default&quot;;
<br>&gt;         };
<br>&gt;
<br>&gt;         gic: interrupt-controller@f1010000 {
<br>&gt;             compatible =3D &quot;arm,gic-400&quot;;
<br>&gt;             #interrupt-cells =3D &lt;3&gt;;
<br>&gt;             #address-cells =3D &lt;0&gt;;
<br>&gt;             interrupt-controller;
<br>&gt;             reg =3D &lt;0x0 0xf1010000 0 0x1000&gt;,
<br>&gt;                   &lt;0x0 0xf102f000 0 0x20000&gt;,
<br>&gt;                   &lt;0x0 0xf1040000 0 0x20000&gt;,
<br>&gt;                   &lt;0x0 0xf106f000 0 0x20000&gt;;
<br>&gt;             interrupts =3D &lt;GIC_PPI 9
<br>&gt;                     (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_HIGH)=
&gt;;
<br>&gt;         };
<br>&gt;
<br>&gt; When Linux is started on the inmate cell, I can see its booting th=
rough but it doesn&#39;t  fall into shell.
<br>&gt;
<br>&gt; --- a/drivers/irqchip/irq-gic.c
<br>&gt; +++ b/drivers/irqchip/irq-gic.c
<br>&gt; @@ -341,6 +341,9 @@ static void __exception_irq_entry gic_handle_i=
rq(struct pt_regs *regs)
<br>&gt;                 irqstat =3D readl_relaxed(cpu_base + GIC_CPU_INTAC=
K);
<br>&gt;                 irqnr =3D irqstat &amp; GICC_IAR_INT_ID_MASK;
<br>&gt;
<br>&gt; +               if (irqnr &lt; 1020)
<br>&gt; +                       pr_err(&quot;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&=
gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;%s We received IRQ:%u&lt;&lt;&lt;&lt;&lt=
;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;\n&quot;, __func__, irqnr);
<br>&gt; +
<br>&gt;                 if (unlikely(irqnr &gt;=3D 1020))
<br>&gt;                         break;
<br>&gt;
<br>&gt; I added the above and I can see the Linux inmate receives only 0/1=
/27 interrupts.
<br>&gt;
<br>&gt; Which gives me a feeling the Linux inmate isn&#39;t receiving the =
required interrupts.
<br>&gt;
<br>&gt; Any pointers on where I should be looking into?
<br>&gt;
<br>Ive fixed this by updating the GIC masks.
<br>
<br>Cheers,
<br>Prabhakar
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/aa2b89e1-18cf-4089-b793-1da11ae04b77n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/aa2b89e1-18cf-4089-b793-1da11ae04b77n%40googlegroups.co=
m</a>.<br />

------=_Part_1279_2093585497.1664384754454--

------=_Part_1278_1573404438.1664384754454--
